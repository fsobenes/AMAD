package com.example.myapplication.ui

import android.os.Bundle
import android.widget.ListView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.FragmentTransaction
import com.example.myapplication.Adapter.MyStyleListAdapter
import com.example.myapplication.Model.StyleBrandModel
import com.example.myapplication.R
import java.util.*
import kotlin.collections.ArrayList

class MyStyleActivity : AppCompatActivity() {
    private val fragmentManager = supportFragmentManager
    var position: Int =0;

    private val firstFragment =AlertFragment()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_my_style)
        val textCancel:TextView=findViewById<TextView>(R.id.txt_cancel)
        textCancel.setOnClickListener {
finish()        }

        var mListView =findViewById<ListView>(R.id.userlist)
        var list = mutableListOf<StyleBrandModel>()
        val textViewOk: TextView = findViewById(R.id.txt_ok)
        val textViewMyStyle: TextView = findViewById(R.id.txt_your_style
        )

        list.add(StyleBrandModel("Zara or TopShop",      R.drawable.imageone,""  ))
        list.add(StyleBrandModel("Nike or Puma",     R.drawable.imagetwo ,"" ))
        list.add(StyleBrandModel("American Eagle",  R.drawable.imagesthree ,"" ))
        list.add(StyleBrandModel("Hollister",    R.drawable.imagefour,""))


        arrayListSwitch.add("0")
        arrayListSwitch.add("0")
        arrayListSwitch.add("0")
        arrayListSwitch.add("0")
        arrayListSwitch.add("0")

        arrayListBrand.add("")
        arrayListBrand.add("")
        arrayListBrand.add("")
        arrayListBrand.add("")


        textViewOk.setOnClickListener {
//    var fr = getFragmentManager()?.beginTransaction()
//    fr?.replace(R.id.nav_host_fragment, AlertFragment())
//    fr?.commit()

    val arrayListValue =
        ArrayList<String>()
    for (i in MyStyleActivity.arrayListSwitch.indices) {
        if (MyStyleActivity.arrayListSwitch[i]=="1") {
            arrayListValue.add("yes")
            position=i
        }
    }
    if (arrayListValue.size < 1) {
        textViewMyStyle.setText("Your Style: Hollister" )
        arrayListSwitch[2]="1"
        list.set(2,StyleBrandModel("Puma",  R.drawable.imagesthree ,"1" ))
        mListView.adapter = MyStyleListAdapter(this,R.layout.my_style_layout,list)

        mListView.deferNotifyDataSetChanged()

    }else if (arrayListValue.size<2){
        textViewMyStyle.setText("Your Style: " + arrayListBrand[position])



    }
   else{
        val fragmentTransaction = fragmentManager.beginTransaction()
        fragmentTransaction.replace(R.id.frame, AlertFragment())
        fragmentTransaction.commit()

    }


}
        mListView.adapter = MyStyleListAdapter(this,R.layout.my_style_layout,list)
        mListView.deferNotifyDataSetChanged()


    }
    companion object {
        val arrayListSwitch = ArrayList<String>()
        var arrayListBrand:ArrayList<String> = ArrayList<String>()

    }

}

private fun FragmentTransaction?.replace(navHostFragment: Int, alertFragment: AlertFragment) {

}
