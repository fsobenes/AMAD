package com.example.myapplication.Adapter

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat.startActivity
import androidx.fragment.app.FragmentTransaction
import com.example.myapplication.Model.BrandModel
import com.example.myapplication.R
import com.example.myapplication.WebViewActivity
import com.example.myapplication.ui.AlertFragment
import com.example.myapplication.ui.MyStyleActivity

public class MyListAdapter(var mCtx: Context, var resource:Int, var items:List<BrandModel>)
    : ArrayAdapter<BrandModel>( mCtx , resource , items ){
    private val fragmentManager = AlertFragment();




    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {

        val layoutInflater : LayoutInflater = LayoutInflater.from(mCtx)

        val view : View = layoutInflater.inflate(resource , null )
        val imageView : ImageView = view.findViewById(R.id.img_arrow)
        var textView : TextView = view.findViewById(R.id.txt_brand)
        val linearLayout : LinearLayout= view.findViewById(R.id.linearLayout)


        var brandModel : BrandModel = items[position]

        imageView.setImageDrawable(mCtx.resources.getDrawable(brandModel.photo))
        textView.text = brandModel.title
        linearLayout.setOnClickListener {
            val sharedPreferences: SharedPreferences =mCtx.getSharedPreferences("SearchCount",0)
            val editor: SharedPreferences.Editor =  sharedPreferences.edit()

            editor.putString("result",brandModel.url)
            editor.putString("result1",brandModel.title)
            editor.apply()
            editor.commit()
            val intent = Intent(mCtx, WebViewActivity::class.java)
            mCtx.startActivity(intent)

        }

        return view
    }

}


