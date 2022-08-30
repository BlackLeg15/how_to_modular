package br.com.lifecare

import android.Manifest
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.IBinder
import android.widget.Toast
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import com.google.android.gms.location.*

class ForegroundService : Service() {
    private lateinit var client : FusedLocationProviderClient
    private val customLocationCallback = CustomLocationCallback(this)
    override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
        return START_STICKY
    }

    override fun onBind(p0: Intent?): IBinder? {
        return null
    }

    override fun onCreate() {
        super.onCreate()
        buildNotification()
        requestLocationUpdates()
    }

    private fun buildNotification() {
        val stop = "stop"
        val broadcastIntent = PendingIntent.getBroadcast(
            this, 0, Intent(stop), PendingIntent.FLAG_IMMUTABLE,
        )

        // Create the persistent notification
        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(getString(R.string.app_name))
            .setContentText("Location tracking is working")
            .setOngoing(true)
            .setContentIntent(broadcastIntent)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID, getString(R.string.app_name),
                NotificationManager.IMPORTANCE_DEFAULT
            )
            channel.setShowBadge(false)
            channel.description = "Location tracking is working"
            channel.setSound(null, null)
            val manager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }
        startForeground(1, builder.build())
    }

    private fun requestLocationUpdates() {
        val request = LocationRequest.create()
        request.interval = 1000
        request.fastestInterval = 3000
        request.priority = Priority.PRIORITY_HIGH_ACCURACY
        client = LocationServices.getFusedLocationProviderClient(this)
        val permission = ContextCompat.checkSelfPermission(
            this,
            Manifest.permission.ACCESS_FINE_LOCATION
        )
        if (permission == PackageManager.PERMISSION_GRANTED) {

            // Request location updates and when an update is

            // received, store the location in Firebase
            client.requestLocationUpdates(request, customLocationCallback, null)
        } else {
            stopSelf()
        }
    }

    override fun onDestroy() {
        client.removeLocationUpdates(customLocationCallback)
        super.onDestroy()

    }

    companion object {
        private const val CHANNEL_ID = "2"
    }
}

class CustomLocationCallback(private val context: Context) : LocationCallback(){

    override fun onLocationResult(locationResult: LocationResult) {
        val location = """
                        Latitude : ${locationResult.lastLocation?.latitude}
                        Longitude : ${locationResult.lastLocation?.longitude}
                        """.trimIndent()
        Toast.makeText(context, location, Toast.LENGTH_SHORT).show()
    }
}