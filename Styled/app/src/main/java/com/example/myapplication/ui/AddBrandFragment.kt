package com.example.myapplication.ui

import androidx.lifecycle.ViewModelProviders
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.TextView

import com.example.myapplication.R
import com.example.myapplication.ui.dashboard.DashboardFragment
import java.util.ArrayList

class AddBrandFragment : Fragment() {



    private lateinit var viewModel: AddBrandViewModel

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val root=inflater.inflate(R.layout.add_brand_fragment, container, false)
        var editTextBrand:EditText=root.findViewById(R.id.edit_brand_name)
        var TextViewSave: TextView =root.findViewById(R.id.txt_save)
        var ButtonBack: Button =root.findViewById(R.id.btn_back)
ButtonBack.setOnClickListener {
    getFragmentManager()?.popBackStack();


}
TextViewSave.setOnClickListener {
    editTextBrand.text
    arrayList.add(editTextBrand.text.toString())
    var fr = getFragmentManager()?.beginTransaction()
    fr?.replace(R.id.nav_host_fragment, DashboardFragment())
    fr?.commit()
}
        return root }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        viewModel = ViewModelProviders.of(this).get(AddBrandViewModel::class.java)
        // TODO: Use the ViewModel
    }
    companion object {
        var arrayList = ArrayList<String>()

    }
}
