package com.neural.androidlearning.utility
import android.util.Log
//import io.ktor.client.*
//import io.ktor.client.call.*
//import io.ktor.client.engine.cio.*
//import io.ktor.client.features.*
//import io.ktor.client.features.get
//import io.ktor.client.request.*
//import io.ktor.client.statement.*
//import io.ktor.http.*

// Will send this to KMM submodule


class FirstNetworkRequest(private val url: String = "https://ktor.io/") {

    suspend fun sendRequest() {
//        val client = HttpClient(CIO)
//        val response: HttpResponse = client.request(url) {
//            method = HttpMethod.Get
////            headers {
////                append(HttpHeaders.Accept, "text/html")
////                append(HttpHeaders.Authorization, "token")
////                append(HttpHeaders.UserAgent, "ktor client")
////            }
////            body = "Body content"
//        }
////        val byteArrayBody: String = response.receive()
//        client.close()
//
//        Log.i("FirstNetworkRequest", response.status.toString())
//        Log.i("FirstNetworkRequest", response.content.toString())
//        Log.i("FirstNetworkRequest", response.readText())
    }
}