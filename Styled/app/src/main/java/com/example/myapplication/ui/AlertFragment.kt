package com.example.myapplication.ui

import androidx.lifecycle.ViewModelProviders
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView

import com.example.myapplication.R

class AlertFragment : Fragment() {



    private lateinit var viewModel: AlertViewModel

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        viewModel =
            ViewModelProviders.of(this).get(AlertViewModel::class.java)
        val root = inflater.inflate(R.layout.alert_fragment, container, false)
val textCancel:TextView=root.findViewById<TextView>(R.id.txt_cancel)
        textCancel.setOnClickListener {
            getActivity()?.getSupportFragmentManager()?.beginTransaction()?.remove(this)?.commit();
        }


        return root
    }

}
