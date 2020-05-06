package com.example.myapplication.ui.dashboard

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.ImageView
import android.widget.ListView
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import com.example.myapplication.R
import com.example.myapplication.ui.AddBrandFragment
import com.example.myapplication.ui.AlertFragment

class DashboardFragment : Fragment() {

    private lateinit var dashboardViewModel: DashboardViewModel

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        dashboardViewModel =
                ViewModelProviders.of(this).get(DashboardViewModel::class.java)
        val root = inflater.inflate(R.layout.fragment_dashboard, container, false)
        val arrayAdapter: ArrayAdapter<*>

        val imageViewAdd: ImageView = root.findViewById(R.id.img_add)
        imageViewAdd.setOnClickListener {
            var fr = getFragmentManager()?.beginTransaction()
            fr?.replace(R.id.nav_host_fragment, AddBrandFragment())
            fr?.commit()
        }
        // access the listView from xml file
        var mListView =root. findViewById<ListView>(R.id.userlist)

        arrayAdapter = ArrayAdapter(requireActivity(),
            android.R.layout.simple_list_item_1, AddBrandFragment.arrayList)
        mListView.adapter = arrayAdapter

    return root
    }
}
