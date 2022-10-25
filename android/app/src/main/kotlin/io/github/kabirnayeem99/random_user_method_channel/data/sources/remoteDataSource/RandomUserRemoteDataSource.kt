package io.github.kabirnayeem99.random_user_method_channel.data.sources.remoteDataSource

import io.github.kabirnayeem99.random_user_method_channel.data.sources.services.RandomUserRemoteApiService
import io.github.kabirnayeem99.random_user_method_channel.domain.entities.Gender
import io.github.kabirnayeem99.random_user_method_channel.domain.entities.User
import retrofit2.awaitResponse

class RandomUserRemoteDataSource(private val apiService: RandomUserRemoteApiService) {


    suspend fun getRandomUsers(): List<User> {
        val response = apiService.getResults().awaitResponse()
        if (!response.isSuccessful) throw  Exception("Failed to get the users");

        return response.body()?.results?.map {
            User(
                name = "${it?.name?.first ?: ""} ${it?.name?.last ?: ""}",
                email = it?.email ?: "",
                phone = it?.phone ?: "",
                fullAddress = it?.location?.city ?: "",
                gender = if (it?.gender == "male") Gender.Male else Gender.Female,
                imageUrl = if (it?.picture?.large?.contains("women") == true) "" else it?.picture?.large
                    ?: ""
            )
        } ?: emptyList()
    }
}