package io.github.kabirnayeem99.random_user_method_channel.presentation

import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import io.github.kabirnayeem99.random_user_method_channel.domain.entities.User
import io.github.kabirnayeem99.random_user_method_channel.domain.repositories.RandomUserRepository
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor(
    private val randomUserRepository: RandomUserRepository
) : ViewModel() {

    suspend fun getUsers(): List<User> = randomUserRepository.getRandomUsers();
}