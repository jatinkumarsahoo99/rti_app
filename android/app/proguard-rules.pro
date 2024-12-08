## Keep Joda-Time library classes
#-keep class org.joda.time.** { *; }
#-keepattributes *Annotation*
#
## Keep Joda-Convert library classes
#-keep class org.joda.convert.** { *; }
#
## Retain annotations used by Joda-Time
#-keepattributes RuntimeVisibleAnnotations
#-keepattributes RuntimeInvisibleAnnotations

# Keep ErrorProne annotations
-keep class com.google.errorprone.annotations.* { *; }

# Keep javax annotations
-keep class javax.annotation.* { *; }

# Keep Joda-Time and Joda-Convert classes
-keep class org.joda.** { *; }

# Keep any classes from Google Crypto Tink
-keep class com.google.crypto.tink.** { *; }

-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue
-dontwarn com.google.errorprone.annotations.CheckReturnValue
-dontwarn com.google.errorprone.annotations.Immutable
-dontwarn com.google.errorprone.annotations.RestrictedApi
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.concurrent.GuardedBy
-dontwarn org.joda.convert.FromString
-dontwarn org.joda.convert.ToString

-dontwarn com.google.api.client.http.GenericUrl
-dontwarn com.google.api.client.http.HttpHeaders
-dontwarn com.google.api.client.http.HttpRequest
-dontwarn com.google.api.client.http.HttpRequestFactory
-dontwarn com.google.api.client.http.HttpResponse
-dontwarn com.google.api.client.http.HttpTransport
-dontwarn com.google.api.client.http.javanet.NetHttpTransport$Builder
-dontwarn com.google.api.client.http.javanet.NetHttpTransport
-dontwarn com.google.errorprone.annotations.InlineMe
-dontwarn javax.annotation.concurrent.ThreadSafe