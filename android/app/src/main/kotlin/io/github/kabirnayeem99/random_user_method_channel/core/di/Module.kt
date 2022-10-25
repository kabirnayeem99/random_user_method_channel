package io.github.kabirnayeem99.random_user_method_channel.core.di

import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import io.github.kabirnayeem99.random_user_method_channel.data.repositories.RandomUserRepositoryImpl
import io.github.kabirnayeem99.random_user_method_channel.data.sources.remoteDataSource.RandomUserRemoteDataSource
import io.github.kabirnayeem99.random_user_method_channel.data.sources.services.RandomUserRemoteApiService
import io.github.kabirnayeem99.random_user_method_channel.domain.repositories.RandomUserRepository
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Singleton

const val BASE_URL: String = "https://randomuser.me/api/"

@dagger.Module
@InstallIn(SingletonComponent::class)
object Module {


    @Singleton
    @Provides
    fun provideGsonConverter(): GsonConverterFactory =
        GsonConverterFactory.create()


    @Singleton
    @Provides
    fun provideRetrofit(
        gsonConverter: GsonConverterFactory
    ): Retrofit {
        val okHttpClient = OkHttpClient.Builder().build()
        return Retrofit.Builder()
            .addConverterFactory(gsonConverter)
            .baseUrl(BASE_URL)
            .client(okHttpClient)
            .build()
    }


    @Singleton
    @Provides
    fun provideRandomUserRemoteApiService(retrofit: Retrofit): RandomUserRemoteApiService =
        retrofit.create(RandomUserRemoteApiService::class.java)

    @Provides
    fun provideRandomUserRemoteDataSource(apiService: RandomUserRemoteApiService): RandomUserRemoteDataSource {
        return RandomUserRemoteDataSource(apiService);
    }

    @Provides
    @Singleton
    fun provideRandomUserRepository(remoteDataSource: RandomUserRemoteDataSource): RandomUserRepository{
        return RandomUserRepositoryImpl(remoteDataSource);
    }
}