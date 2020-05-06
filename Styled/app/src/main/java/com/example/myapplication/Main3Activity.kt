package com.example.myapplication

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity

class Main3Activity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main3)
    }

    private inner class MyWebViewClient : WebViewClient() {
        override fun shouldOverrideUrlLoading(
            view: WebView,
            url: String
        ): Boolean {
            if ("www.example.com" == Uri.parse(url).host) { // This is my website, so do not override; let my WebView load the page
                return false
            }
            // Otherwise, the link is not for a page on my site, so launch another Activity that handles URLs
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
            startActivity(intent)
            return true
        }
    }
}