plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Ensure Flutter plugin is applied last
    id("com.google.gms.google-services") // Firebase Google Services plugin
}

android {
    namespace = "com.gammmee.delala"
    compileSdk = 34  
    ndkVersion = "28.0.13004108"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.gammmee.delala"
        minSdk = 23   
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:32.7.3")) // Latest BOM version
    implementation("com.google.firebase:firebase-auth-ktx")      // Firebase Authentication
    implementation("com.google.firebase:firebase-firestore-ktx") // Firestore Database
    implementation("com.google.firebase:firebase-messaging-ktx") // Firebase Cloud Messaging
    implementation("com.google.firebase:firebase-analytics-ktx") // Firebase Analytics
}
