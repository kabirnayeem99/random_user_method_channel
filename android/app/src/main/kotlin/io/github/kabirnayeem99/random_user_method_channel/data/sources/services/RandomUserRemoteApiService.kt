package io.github.kabirnayeem99.random_user_method_channel.data.sources.services

import io.github.kabirnayeem99.random_user_method_channel.data.dtos.RandomUserGetResponseDto
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface RandomUserRemoteApiService {
    @GET(".")
    fun getResults(
        @Query("results") resultAmount: Int = 10
    ): Call<RandomUserGetResponseDto>
}