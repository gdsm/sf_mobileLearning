import org.jetbrains.kotlin.gradle.plugin.mpp.apple.XCFramework

val coroutineVersion = "1.6.1"
val kotlinVersion = "1.7.10"
val ktorVersion = "2.0.3"
val sqlDelightVersion = "1.5.3"

plugins {
    kotlin("plugin.serialization") version "1.7.10"
    kotlin("multiplatform") version "1.7.10"
    id("com.android.library") version "8.2.0"
    id("com.squareup.sqldelight") version "1.5.3"
}

group = "com.neural"
version = "1.0.0"
val module = rootProject.name

repositories {
    google()
    mavenCentral()
    gradlePluginPortal()
}

kotlin {
    android()
    
    val xcf = XCFramework()
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "kmmLearning"
            xcf.add(this)
        }
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:$coroutineVersion")
                implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.4.0-RC")

                implementation("io.ktor:ktor-client-core:$ktorVersion")
                implementation("io.ktor:ktor-client-serialization:$ktorVersion")

                implementation("com.squareup.sqldelight:runtime:$sqlDelightVersion")
            }
        }
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val androidMain by getting {
            dependencies {
                implementation("io.ktor:ktor-client-android:$ktorVersion")

                implementation("com.squareup.sqldelight:android-driver:$sqlDelightVersion")
            }
        }
        val androidTest by getting
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)

            dependencies {
                implementation("io.ktor:ktor-client-ios:$ktorVersion")

                implementation("com.squareup.sqldelight:native-driver:$sqlDelightVersion")
            }
        }
        val iosX64Test by getting
        val iosArm64Test by getting
        val iosSimulatorArm64Test by getting
        val iosTest by creating {
            dependsOn(commonTest)
            iosX64Test.dependsOn(this)
            iosArm64Test.dependsOn(this)
            iosSimulatorArm64Test.dependsOn(this)
        }
    }
//    dependencies {
//        implementation("com.squareup.sqldelight:gradle-plugin:$sqlDelightVersion")
//    }


    sqldelight {
        database("AppDatabase") {
            packageName = "com.neural.kmmlearning.database.shared.cache"
            version = 2
        }
    }
}

android {
    compileSdk = 34
    namespace = "com.neural.kmmlearning"
    sourceSets["main"].manifest.srcFile("src/androidMain/AndroidManifest.xml")
    defaultConfig {
        minSdk = 26
        targetSdk = 34
    }
}