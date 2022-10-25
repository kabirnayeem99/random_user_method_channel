package io.github.kabirnayeem99.random_user_method_channel.domain.repositories

import io.github.kabirnayeem99.random_user_method_channel.domain.entities.User

interface RandomUserRepository {
    suspend fun getRandomUsers(): List<User>
    suspend fun getRandomUsersJson(): String
}