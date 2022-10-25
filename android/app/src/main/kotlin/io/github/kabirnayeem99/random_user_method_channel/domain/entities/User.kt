package io.github.kabirnayeem99.random_user_method_channel.domain.entities

data class User(
    val name: String,
    val email: String,
    val phone: String,
    val imageUrl: String,
    val fullAddress: String,
    val gender: Gender,
)

enum class Gender {
    Male, Female
}
