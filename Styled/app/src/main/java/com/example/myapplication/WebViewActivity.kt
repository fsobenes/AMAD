package com.example.myapplication

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.Button
import android.widget.TextView
import androidx.core.content.ContextCompat.startActivity

class WebViewActivity : AppCompatActivity() {
    var prefs: SharedPreferences? = null
    var url:String?=null
    var title:String?=null
    var webView: WebView ?=null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_web_view)
        var ButtonBack: Button =findViewById(R.id.btn_back)
        var TextTitle: TextView=findViewById(R.id.txt_title)

        ButtonBack.setOnClickListener {
finish()

        }
        var webView: WebView =findViewById(R.id.wv)
        prefs = getSharedPreferences("SearchCount", 0)
        url=  prefs!!.getString("result","" )
        title=  prefs!!.getString("result1","" )
TextTitle.text=title
        webView.settings.javaScriptEnabled = true
        webView.webViewClient = WebViewClient()

        webView.loadUrl(url)

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
    }}