package br.com.lifecare

import android.Manifest
import android.app.AlertDialog
import android.content.Intent
import android.content.IntentSender
import android.location.LocationManager
import android.net.Uri
import android.os.Build
import android.provider.Settings
import com.karumi.dexter.Dexter
import com.karumi.dexter.listener.multi.MultiplePermissionsListener
import com.karumi.dexter.MultiplePermissionsReport
import com.google.android.gms.common.api.ResolvableApiException
import com.google.android.gms.location.*
import com.karumi.dexter.PermissionToken
import com.karumi.dexter.listener.PermissionRequest
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.lang.Exception

open class MainActivity: FlutterActivity() {

    private val channel = "background_location_service"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            run {
                if (call.method.equals("startLocationService")) {
                    initLocationService()
                    result.success("Location service has been initialized")
                } else if(call.method.equals("stopLocationService")){
                    stopLocationService()
                    result.success("Location service has been stopped")
                }
            }
        }
    }

    private fun stopLocationService(){
        stopService(Intent(this, ForegroundService::class.java))
    }

    private fun initLocationService(){
        val manager = getSystemService(LOCATION_SERVICE) as LocationManager
        if (!manager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
            enableLocationSettings()
        } else {
            requestAppPermissions()
        }
    }

    private fun requestAppPermissions() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            Dexter.withActivity(this@MainActivity)
                .withPermissions(
                    Manifest.permission.ACCESS_FINE_LOCATION,
                    Manifest.permission.ACCESS_COARSE_LOCATION, Manifest.permission.ACCESS_BACKGROUND_LOCATION
                )
                .withListener(object : MultiplePermissionsListener {
                    override fun onPermissionsChecked(report: MultiplePermissionsReport) {

                        // check if all permissions are granted
                        if (report.areAllPermissionsGranted()) {

                            // do you work now

                            //interact.downloadImage(array);
                            startService(Intent(this@MainActivity, ForegroundService::class.java))
                        }


                        // check for permanent denial of any permission
                        if (report.isAnyPermissionPermanentlyDenied) {

                            // permission is denied permanently, navigate user to app settings
                            showSettingsDialog()

                            //finish();
                        }
                    }

                    override fun onPermissionRationaleShouldBeShown(
                        permissions: List<PermissionRequest>,
                        token: PermissionToken
                    ) {
                        token.continuePermissionRequest()
                    }
                })
                .onSameThread()
                .check()
        }
    }

    private fun showSettingsDialog() {
        val builder = AlertDialog.Builder(this@MainActivity)
        builder.setTitle("Need Permissions")
        builder.setMessage("This app needs permission to use this feature. You can grant them in app settings.")
        builder.setPositiveButton("GOTO SETTINGS") { dialog, _ ->
            dialog.cancel()
            openSettings()
        }
        builder.setNegativeButton("Cancel") { dialog, _ -> dialog.cancel() }
        builder.show()
    }

    private fun openSettings() {
        val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
        val uri = Uri.fromParts("package", packageName, null)
        intent.data = uri
        startActivityForResult(intent, 101)
    }

    private fun enableLocationSettings() {
        val locationRequest = LocationRequest.create()
            .setInterval(1000)
            .setFastestInterval(3000)
            .setPriority(Priority.PRIORITY_HIGH_ACCURACY)
        val builder = LocationSettingsRequest.Builder()
            .addLocationRequest(locationRequest)
        LocationServices
            .getSettingsClient(this)
            .checkLocationSettings(builder.build())
            .addOnSuccessListener(this) { }
            .addOnFailureListener(this) { ex: Exception? ->
                if (ex is ResolvableApiException) {

                    // Location settings are NOT satisfied,  but this can be fixed  by showing the user a dialog.
                    try {

                        // Show the dialog by calling startResolutionForResult(),  and check the result in onActivityResult().
                        ex.startResolutionForResult(this, 123)
                    } catch (sendEx: IntentSender.SendIntentException) {

                        // Ignore the error.
                    }
                }
            }
    }
}