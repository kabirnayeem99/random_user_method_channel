package io.github.kabirnayeem99.random_user_method_channel.data.dtos


import com.google.gson.annotations.SerializedName

data class RandomUserGetResponseDto(
    @SerializedName("info")
    val info: Info?,
    @SerializedName("results")
    val results: List<Result?>?
) {
    data class Info(
        @SerializedName("page")
        val page: Int?, // 1
        @SerializedName("results")
        val results: Int?, // 1
        @SerializedName("seed")
        val seed: String?, // 9f74318ba9af10ae
        @SerializedName("version")
        val version: String? // 1.4
    )

    data class Result(
        @SerializedName("cell")
        val cell: String?, // 077 780 63 09
        @SerializedName("dob")
        val dob: Dob?,
        @SerializedName("email")
        val email: String?, // georg.roussel@example.com
        @SerializedName("gender")
        val gender: String?, // male
        @SerializedName("id")
        val id: Id?,
        @SerializedName("location")
        val location: Location?,
        @SerializedName("login")
        val login: Login?,
        @SerializedName("name")
        val name: Name?,
        @SerializedName("nat")
        val nat: String?, // CH
        @SerializedName("phone")
        val phone: String?, // 079 803 37 85
        @SerializedName("picture")
        val picture: Picture?,
        @SerializedName("registered")
        val registered: Registered?
    ) {
        data class Dob(
            @SerializedName("age")
            val age: Int?, // 58
            @SerializedName("date")
            val date: String? // 1964-04-14T00:29:06.542Z
        )

        data class Id(
            @SerializedName("name")
            val name: String?, // AVS
            @SerializedName("value")
            val value: String? // 756.2774.0896.61
        )

        data class Location(
            @SerializedName("city")
            val city: String?, // Rances
            @SerializedName("coordinates")
            val coordinates: Coordinates?,
            @SerializedName("country")
            val country: String?, // Switzerland
            @SerializedName("postcode")
            val postcode: Any?, // 6425
            @SerializedName("state")
            val state: String?, // Nidwalden
            @SerializedName("street")
            val street: Street?,
            @SerializedName("timezone")
            val timezone: Timezone?
        ) {
            data class Coordinates(
                @SerializedName("latitude")
                val latitude: String?, // -63.8147
                @SerializedName("longitude")
                val longitude: String? // -154.2462
            )

            data class Street(
                @SerializedName("name")
                val name: String?, // Rue Duquesne
                @SerializedName("number")
                val number: Any? // 2037
            )

            data class Timezone(
                @SerializedName("description")
                val description: String?, // Beijing, Perth, Singapore, Hong Kong
                @SerializedName("offset")
                val offset: String? // +8:00
            )
        }

        data class Login(
            @SerializedName("md5")
            val md5: String?, // 23eae3c84ba0df48decce5b3222361ec
            @SerializedName("password")
            val password: String?, // venom
            @SerializedName("salt")
            val salt: String?, // i0rwUcQL
            @SerializedName("sha1")
            val sha1: String?, // ae264bb12b6a86b0237444cb41041053aba6dfc9
            @SerializedName("sha256")
            val sha256: String?, // f52f970617e04bfaae9d12efc53b4648dcce3e85abd7c14939f5769dd4345a63
            @SerializedName("username")
            val username: String?, // orangefish351
            @SerializedName("uuid")
            val uuid: String? // 5ed3ea86-2f45-4b0b-9f84-45809dd154ce
        )

        data class Name(
            @SerializedName("first")
            val first: String?, // Georg
            @SerializedName("last")
            val last: String?, // Roussel
            @SerializedName("title")
            val title: String? // Monsieur
        )

        data class Picture(
            @SerializedName("large")
            val large: String?, // https://randomuser.me/api/portraits/men/5.jpg
            @SerializedName("medium")
            val medium: String?, // https://randomuser.me/api/portraits/med/men/5.jpg
            @SerializedName("thumbnail")
            val thumbnail: String? // https://randomuser.me/api/portraits/thumb/men/5.jpg
        )

        data class Registered(
            @SerializedName("age")
            val age: Int?, // 9
            @SerializedName("date")
            val date: String? // 2013-01-09T02:42:19.888Z
        )
    }
}