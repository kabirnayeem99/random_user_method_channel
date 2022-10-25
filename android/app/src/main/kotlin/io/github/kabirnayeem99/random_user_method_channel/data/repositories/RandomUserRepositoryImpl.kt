package io.github.kabirnayeem99.random_user_method_channel.data.repositories

import android.util.Log
import com.google.gson.Gson
import io.github.kabirnayeem99.random_user_method_channel.data.sources.remoteDataSource.RandomUserRemoteDataSource
import io.github.kabirnayeem99.random_user_method_channel.domain.entities.User
import io.github.kabirnayeem99.random_user_method_channel.domain.repositories.RandomUserRepository

private const val TAG = "RandomUserRepositoryImp"

class RandomUserRepositoryImpl(private val remoteDataSource: RandomUserRemoteDataSource) :
    RandomUserRepository {
    override suspend fun getRandomUsers(): List<User> {
        return try {
            remoteDataSource.getRandomUsers()
        } catch (e: Exception) {
            Log.e(TAG, "getRandomUsers: ${e.localizedMessage}", e)
            return emptyList()
        }
    }

    override suspend fun getRandomUsersJson(): String {
        return try {
            val users = getRandomUsers()
            Gson().toJson(users)
        } catch (e: Exception) {
            Log.e(TAG, "getRandomUsersJson: Failed to parcelise users", e)
            ""
        }
    }
}