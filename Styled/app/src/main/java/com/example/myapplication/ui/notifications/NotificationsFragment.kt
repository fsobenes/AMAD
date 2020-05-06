package com.example.myapplication.ui.notifications

import android.graphics.ColorSpace
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ListView
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import com.example.myapplication.Adapter.MyListAdapter
import com.example.myapplication.Model.BrandModel
import com.example.myapplication.R

class NotificationsFragment : Fragment() {

    private lateinit var notificationsViewModel: NotificationsViewModel

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        notificationsViewModel =
                ViewModelProviders.of(this).get(NotificationsViewModel::class.java)
        val root = inflater.inflate(R.layout.fragment_notifications, container, false)
        var mListView =root.findViewById<ListView>(R.id.userlist)
        var list = mutableListOf<BrandModel>()
        list.add(BrandModel("Adidas",      R.drawable.rightarrows,"https://www.adidas.com"  ))
        list.add(BrandModel("American Eagle",     R.drawable.rightarrows ,"https://www.ae.com" ))
        list.add(BrandModel("Burberry",  R.drawable.rightarrows ,"https://www.burberry.com" ))
        list.add(BrandModel("Gucci",    R.drawable.rightarrows,"https://www.Gucci.com" ))
        list.add(BrandModel("Hollister",  R.drawable.rightarrows,"https://www.hollisterco.com," ))
        list.add(BrandModel("Nike",     R.drawable.rightarrows,"https://www.nike.com"  ))
        list.add(BrandModel("Pacsun",    R.drawable.rightarrows,"https://www.pacsun.com"  ))
        list.add(BrandModel("Puma", R.drawable.rightarrows,"https://www.puma.com"  ))
        list.add(BrandModel("Topshop",    R.drawable.rightarrows,"https://www.topshop.com" ))
        list.add(BrandModel("Urban Outfitters",   R.drawable.rightarrows,"https://www.urbanoutfitters.com"  ))
        list.add(BrandModel("Zara",   R.drawable.rightarrows,"https://www.zara.com"  ))
         mListView.adapter = MyListAdapter(requireContext(),R.layout.brand_list,list)
        return root
    }
}
