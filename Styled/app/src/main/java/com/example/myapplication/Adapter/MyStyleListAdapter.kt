package com.example.myapplication.Adapter

import android.app.Activity
import android.content.Context
import android.content.SharedPreferences
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.ImageView
import androidx.appcompat.widget.SwitchCompat
import com.example.myapplication.Model.StyleBrandModel
import com.example.myapplication.R
import com.example.myapplication.ui.MyStyleActivity

public class MyStyleListAdapter(var mCtx: Context, var resource:Int, var items:List<StyleBrandModel>)
    : ArrayAdapter<StyleBrandModel>( mCtx , resource , items ){




    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {

        val layoutInflater : LayoutInflater = LayoutInflater.from(mCtx)

        val view : View = layoutInflater.inflate(resource , null )
        val imageView : ImageView = view.findViewById(R.id.img_style)
      //  var textView : TextView = view.findViewById(R.id.txt_brand)
        val switch : SwitchCompat = view.findViewById(R.id.swOnOff)

        var stylebrandModel : StyleBrandModel = items[position]

        imageView.setImageDrawable(mCtx.resources.getDrawable(stylebrandModel.photo))
        if(stylebrandModel.value=="1"){
            switch.isChecked=true
        }
        if( MyStyleActivity.arrayListSwitch[position]=="1"){
            switch.isChecked=true
        }
      //  textView.text = StyleBrandModel.title
        switch.setOnCheckedChangeListener { buttonView, isChecked ->
            if (isChecked) {
                // The switch is enabled/checked
                MyStyleActivity.arrayListSwitch[position]="1"
MyStyleActivity.arrayListBrand.add(position,stylebrandModel.title)
                // Change the app background color
            } else {
                // The switch is disabled
                MyStyleActivity.arrayListSwitch[position]="0"
                MyStyleActivity.arrayListBrand.add(position,stylebrandModel.title)

                // Set the app background color to light gray
            }
        }

        notifyDataSetChanged()

        return view
    }

}
