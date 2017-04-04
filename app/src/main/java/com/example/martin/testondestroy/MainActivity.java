package com.example.martin.testondestroy;

import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.FrameLayout;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";

    private Runnable mChangeContentViewRunnable = new Runnable() {
        @Override
        public void run() {
            Log.d(TAG, "callback!");
            setContentView(new TextView(MainActivity.this));
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d(TAG, "onCreate");
        setContentView(new FrameLayout(this));

    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        Log.d(TAG, "onBackPressed");
        finish();
    }

    @Override
    protected void onDestroy() {
        Log.d(TAG, "onDEstroy");
        new Handler().postDelayed(mChangeContentViewRunnable, 3000);
        super.onDestroy();
    }
}
