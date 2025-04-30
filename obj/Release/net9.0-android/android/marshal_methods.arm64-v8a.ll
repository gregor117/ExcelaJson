; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [187 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [561 x i64] [
	i64 u0x0071cf2d27b7d61e, ; 0: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 95
	i64 u0x01109b0e4d99e61f, ; 1: System.ComponentModel.Annotations.dll => 110
	i64 u0x02123411c4e01926, ; 2: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 91
	i64 u0x02827b47e97f2378, ; 3: System.Security.Cryptography.Pkcs.dll => 70
	i64 u0x02abedc11addc1ed, ; 4: lib_Mono.Android.Runtime.dll.so => 185
	i64 u0x032267b2a94db371, ; 5: lib_Xamarin.AndroidX.AppCompat.dll.so => 74
	i64 u0x033a1d0324ba06bd, ; 6: Microsoft.IO.RecyclableMemoryStream.dll => 58
	i64 u0x0382996c86dd4ae4, ; 7: MauiApp_Interfaz => 103
	i64 u0x043032f1d071fae0, ; 8: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 9: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 10: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 11: System.Net.Primitives => 136
	i64 u0x0565d18c6da3de38, ; 12: Xamarin.AndroidX.RecyclerView => 93
	i64 u0x0581db89237110e9, ; 13: lib_System.Collections.dll.so => 109
	i64 u0x05989cb940b225a9, ; 14: Microsoft.Maui.dll => 61
	i64 u0x05a1c25e78e22d87, ; 15: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 150
	i64 u0x06076b5d2b581f08, ; 16: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x06388ffe9f6c161a, ; 17: System.Xml.Linq.dll => 177
	i64 u0x0680a433c781bb3d, ; 18: Xamarin.AndroidX.Collection.Jvm => 77
	i64 u0x07c57877c7ba78ad, ; 19: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 20: System.Collections.NonGeneric => 107
	i64 u0x08a7c865576bbde7, ; 21: System.Reflection.Primitives => 149
	i64 u0x08f3c9788ee2153c, ; 22: Xamarin.AndroidX.DrawerLayout => 82
	i64 u0x09138715c92dba90, ; 23: lib_System.ComponentModel.Annotations.dll.so => 110
	i64 u0x0919c28b89381a0b, ; 24: lib_Microsoft.Extensions.Options.dll.so => 56
	i64 u0x092266563089ae3e, ; 25: lib_System.Collections.NonGeneric.dll.so => 107
	i64 u0x09d144a7e214d457, ; 26: System.Security.Cryptography => 164
	i64 u0x0abb3e2b271edc45, ; 27: System.Threading.Channels.dll => 171
	i64 u0x0add38f5cf8f3bef, ; 28: ExcelDataReader.DataSet => 40
	i64 u0x0b3b632c3bbee20c, ; 29: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b6aff547b84fbe9, ; 30: Xamarin.KotlinX.Serialization.Core.Jvm => 101
	i64 u0x0be2e1f8ce4064ed, ; 31: Xamarin.AndroidX.ViewPager => 96
	i64 u0x0c3ca6cc978e2aae, ; 32: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c59ad9fbbd43abe, ; 33: Mono.Android => 186
	i64 u0x0c7790f60165fc06, ; 34: lib_Microsoft.Maui.Essentials.dll.so => 62
	i64 u0x0e14e73a54dda68e, ; 35: lib_System.Net.NameResolution.dll.so => 134
	i64 u0x102a31b45304b1da, ; 36: Xamarin.AndroidX.CustomView => 81
	i64 u0x10f6cfcbcf801616, ; 37: System.IO.Compression.Brotli => 125
	i64 u0x114443cdcf2091f1, ; 38: System.Security.Cryptography.Primitives => 162
	i64 u0x123639456fb056da, ; 39: System.Reflection.Emit.Lightweight.dll => 148
	i64 u0x124f38a5d8cb5fb8, ; 40: K4os.Compression.LZ4.dll => 42
	i64 u0x125b7f94acb989db, ; 41: Xamarin.AndroidX.RecyclerView.dll => 93
	i64 u0x137b34d6751da129, ; 42: System.Drawing.Common => 69
	i64 u0x13a01de0cbc3f06c, ; 43: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 44: lib_Java.Interop.dll.so => 184
	i64 u0x13f1e880c25d96d1, ; 45: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143d8ea60a6a4011, ; 46: Microsoft.Extensions.DependencyInjection.Abstractions => 50
	i64 u0x152a448bd1e745a7, ; 47: Microsoft.Win32.Primitives => 105
	i64 u0x159cc6c81072f00e, ; 48: lib_System.Diagnostics.EventLog.dll.so => 68
	i64 u0x16ea2b318ad2d830, ; 49: System.Security.Cryptography.Algorithms => 159
	i64 u0x17125c9a85b4929f, ; 50: lib_netstandard.dll.so => 182
	i64 u0x17b56e25558a5d36, ; 51: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 52: System.Text.Encodings.Web => 168
	i64 u0x18402a709e357f3b, ; 53: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 101
	i64 u0x184e267d06b0b855, ; 54: EPPlus.System.Drawing.dll => 38
	i64 u0x18a9befae51bb361, ; 55: System.Net.WebClient => 140
	i64 u0x18f0ce884e87d89a, ; 56: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x19a4c090f14ebb66, ; 57: System.Security.Claims => 158
	i64 u0x1a91866a319e9259, ; 58: lib_System.Collections.Concurrent.dll.so => 106
	i64 u0x1aac34d1917ba5d3, ; 59: lib_System.dll.so => 181
	i64 u0x1aad60783ffa3e5b, ; 60: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1c5217a9e4973753, ; 61: lib_Microsoft.Extensions.FileProviders.Physical.dll.so => 52
	i64 u0x1c753b5ff15bce1b, ; 62: Mono.Android.Runtime.dll => 185
	i64 u0x1dba6509cc55b56f, ; 63: lib_Google.Protobuf.dll.so => 41
	i64 u0x1e3d87657e9659bc, ; 64: Xamarin.AndroidX.Navigation.UI => 92
	i64 u0x1e71143913d56c10, ; 65: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x1ed8fcce5e9b50a0, ; 66: Microsoft.Extensions.Options.dll => 56
	i64 u0x1f055d15d807e1b2, ; 67: System.Xml.XmlSerializer => 180
	i64 u0x20237ea48006d7a8, ; 68: lib_System.Net.WebClient.dll.so => 140
	i64 u0x209375905fcc1bad, ; 69: lib_System.IO.Compression.Brotli.dll.so => 125
	i64 u0x20edad43b59fbd8e, ; 70: System.Security.Permissions.dll => 72
	i64 u0x20fab3cf2dfbc8df, ; 71: lib_System.Diagnostics.Process.dll.so => 118
	i64 u0x212dabedfbeb018b, ; 72: lib_EPPlus.dll.so => 36
	i64 u0x2174319c0d835bc9, ; 73: System.Runtime => 157
	i64 u0x21cc7e445dcd5469, ; 74: System.Reflection.Emit.ILGeneration => 147
	i64 u0x220fd4f2e7c48170, ; 75: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x22ff71cb1237d0af, ; 76: lib_OLT.Extensions.EPPlus.dll.so => 66
	i64 u0x234b2420fe4b9bdc, ; 77: lib_K4os.Compression.LZ4.dll.so => 42
	i64 u0x237be844f1f812c7, ; 78: System.Threading.Thread.dll => 172
	i64 u0x2407aef2bbe8fadf, ; 79: System.Console => 115
	i64 u0x240abe014b27e7d3, ; 80: Xamarin.AndroidX.Core.dll => 79
	i64 u0x247619fe4413f8bf, ; 81: System.Runtime.Serialization.Primitives.dll => 156
	i64 u0x252073cc3caa62c2, ; 82: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x2662c629b96b0b30, ; 83: lib_Xamarin.Kotlin.StdLib.dll.so => 99
	i64 u0x268c1439f13bcc29, ; 84: lib_Microsoft.Extensions.Primitives.dll.so => 57
	i64 u0x273f3515de5faf0d, ; 85: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 86: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x27b410442fad6cf1, ; 87: Java.Interop.dll => 184
	i64 u0x2801845a2c71fbfb, ; 88: System.Net.Primitives.dll => 136
	i64 u0x2a128783efe70ba0, ; 89: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2a3b095612184159, ; 90: lib_System.Net.NetworkInformation.dll.so => 135
	i64 u0x2a6507a5ffabdf28, ; 91: System.Diagnostics.TraceSource.dll => 120
	i64 u0x2aca887893eb83b6, ; 92: lib_MauiApp_Interfaz.dll.so => 103
	i64 u0x2ad156c8e1354139, ; 93: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 94: System.Text.RegularExpressions.dll => 170
	i64 u0x2afc1c4f898552ee, ; 95: lib_System.Formats.Asn1.dll.so => 124
	i64 u0x2b148910ed40fbf9, ; 96: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2b4d4904cebfa4e9, ; 97: Microsoft.Extensions.FileSystemGlobbing => 53
	i64 u0x2b73dc6bb40edd58, ; 98: EPPlus.Interfaces.dll => 37
	i64 u0x2c8bd14bb93a7d82, ; 99: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2cbd9262ca785540, ; 100: lib_System.Text.Encoding.CodePages.dll.so => 166
	i64 u0x2cc9e1fed6257257, ; 101: lib_System.Reflection.Emit.Lightweight.dll.so => 148
	i64 u0x2cd723e9fe623c7c, ; 102: lib_System.Private.Xml.Linq.dll.so => 145
	i64 u0x2d169d318a968379, ; 103: System.Threading.dll => 174
	i64 u0x2d47774b7d993f59, ; 104: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2db915caf23548d2, ; 105: System.Text.Json.dll => 169
	i64 u0x2e6f1f226821322a, ; 106: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f02f94df3200fe5, ; 107: System.Diagnostics.Process => 118
	i64 u0x2f2e98e1c89b1aff, ; 108: System.Xml.ReaderWriter => 178
	i64 u0x2f5911d9ba814e4e, ; 109: System.Diagnostics.Tracing => 121
	i64 u0x309ee9eeec09a71e, ; 110: lib_Xamarin.AndroidX.Fragment.dll.so => 83
	i64 u0x31195fef5d8fb552, ; 111: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x32243413e774362a, ; 112: Xamarin.AndroidX.CardView.dll => 76
	i64 u0x3235427f8d12dae1, ; 113: lib_System.Drawing.Primitives.dll.so => 122
	i64 u0x329753a17a517811, ; 114: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 115: lib_System.Xml.ReaderWriter.dll.so => 178
	i64 u0x33642d5508314e46, ; 116: Microsoft.Extensions.FileSystemGlobbing.dll => 53
	i64 u0x33a31443733849fe, ; 117: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x341abc357fbb4ebf, ; 118: lib_System.Net.Sockets.dll.so => 139
	i64 u0x34dfd74fe2afcf37, ; 119: Microsoft.Maui => 61
	i64 u0x34e292762d9615df, ; 120: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 121: Microsoft.Maui.Controls => 59
	i64 u0x353590da528c9d22, ; 122: System.ComponentModel.Annotations => 110
	i64 u0x3549870798b4cd30, ; 123: lib_Xamarin.AndroidX.ViewPager2.dll.so => 97
	i64 u0x355282fc1c909694, ; 124: Microsoft.Extensions.Configuration => 45
	i64 u0x355c649948d55d97, ; 125: lib_System.Runtime.Intrinsics.dll.so => 152
	i64 u0x36b2b50fdf589ae2, ; 126: System.Reflection.Emit.Lightweight => 148
	i64 u0x374ef46b06791af6, ; 127: System.Reflection.Primitives.dll => 149
	i64 u0x38049b5c59b39324, ; 128: System.Runtime.CompilerServices.Unsafe => 150
	i64 u0x385c17636bb6fe6e, ; 129: Xamarin.AndroidX.CustomView.dll => 81
	i64 u0x38869c811d74050e, ; 130: System.Net.NameResolution.dll => 134
	i64 u0x39251dccb84bdcaa, ; 131: lib_System.Configuration.ConfigurationManager.dll.so => 67
	i64 u0x393c226616977fdb, ; 132: lib_Xamarin.AndroidX.ViewPager.dll.so => 96
	i64 u0x395e37c3334cf82a, ; 133: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x39aa39fda111d9d3, ; 134: Newtonsoft.Json => 65
	i64 u0x39c3107c28752af1, ; 135: lib_Microsoft.Extensions.FileProviders.Abstractions.dll.so => 51
	i64 u0x3ab5859054645f72, ; 136: System.Security.Cryptography.Primitives.dll => 162
	i64 u0x3b2c47fe17204e4d, ; 137: MySql.Data => 64
	i64 u0x3b860f9932505633, ; 138: lib_System.Text.Encoding.Extensions.dll.so => 167
	i64 u0x3c3aafb6b3a00bf6, ; 139: lib_System.Security.Cryptography.X509Certificates.dll.so => 163
	i64 u0x3c7c495f58ac5ee9, ; 140: Xamarin.Kotlin.StdLib => 99
	i64 u0x3d2b1913edfc08d7, ; 141: lib_System.Threading.ThreadPool.dll.so => 173
	i64 u0x3d46f0b995082740, ; 142: System.Xml.Linq => 177
	i64 u0x3d9c2a242b040a50, ; 143: lib_Xamarin.AndroidX.Core.dll.so => 79
	i64 u0x3daa14724d8f58e8, ; 144: Google.Protobuf.dll => 41
	i64 u0x3db495de2204755c, ; 145: Microsoft.Extensions.Configuration.FileExtensions => 47
	i64 u0x4019503dd3d938a1, ; 146: MySql.Data.dll => 64
	i64 u0x407a10bb4bf95829, ; 147: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 89
	i64 u0x415e36f6b13ff6f3, ; 148: System.Configuration.ConfigurationManager.dll => 67
	i64 u0x41cab042be111c34, ; 149: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 75
	i64 u0x43375950ec7c1b6a, ; 150: netstandard.dll => 182
	i64 u0x434c4e1d9284cdae, ; 151: Mono.Android.dll => 186
	i64 u0x43950f84de7cc79a, ; 152: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x448bd33429269b19, ; 153: Microsoft.CSharp => 104
	i64 u0x4499fa3c8e494654, ; 154: lib_System.Runtime.Serialization.Primitives.dll.so => 156
	i64 u0x4515080865a951a5, ; 155: Xamarin.Kotlin.StdLib.dll => 99
	i64 u0x45c40276a42e283e, ; 156: System.Diagnostics.TraceSource => 120
	i64 u0x46a4213bc97fe5ae, ; 157: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x47358bd471172e1d, ; 158: lib_System.Xml.Linq.dll.so => 177
	i64 u0x47daf4e1afbada10, ; 159: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x4953c088b9debf0a, ; 160: lib_System.Security.Permissions.dll.so => 72
	i64 u0x49e952f19a4e2022, ; 161: System.ObjectModel => 143
	i64 u0x4a5667b2462a664b, ; 162: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 92
	i64 u0x4b7b6532ded934b7, ; 163: System.Text.Json => 169
	i64 u0x4c7755cf07ad2d5f, ; 164: System.Net.Http.Json.dll => 132
	i64 u0x4cc5f15266470798, ; 165: lib_Xamarin.AndroidX.Loader.dll.so => 88
	i64 u0x4cf6f67dc77aacd2, ; 166: System.Net.NetworkInformation.dll => 135
	i64 u0x4d479f968a05e504, ; 167: System.Linq.Expressions.dll => 129
	i64 u0x4d55a010ffc4faff, ; 168: System.Private.Xml => 146
	i64 u0x4d95fccc1f67c7ca, ; 169: System.Runtime.Loader.dll => 153
	i64 u0x4dcf44c3c9b076a2, ; 170: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 171: Xamarin.AndroidX.Loader.dll => 88
	i64 u0x4e32f00cb0937401, ; 172: Mono.Android.Runtime => 185
	i64 u0x4e5eea4668ac2b18, ; 173: System.Text.Encoding.CodePages => 166
	i64 u0x4ebd0c4b82c5eefc, ; 174: lib_System.Threading.Channels.dll.so => 171
	i64 u0x4f21ee6ef9eb527e, ; 175: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x5037f0be3c28c7a3, ; 176: lib_Microsoft.Maui.Controls.dll.so => 59
	i64 u0x5131bbe80989093f, ; 177: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 86
	i64 u0x51bb8a2afe774e32, ; 178: System.Drawing => 123
	i64 u0x526ce79eb8e90527, ; 179: lib_System.Net.Primitives.dll.so => 136
	i64 u0x52829f00b4467c38, ; 180: lib_System.Data.Common.dll.so => 116
	i64 u0x529ffe06f39ab8db, ; 181: Xamarin.AndroidX.Core => 79
	i64 u0x52ff996554dbf352, ; 182: Microsoft.Maui.Graphics => 63
	i64 u0x535f7e40e8fef8af, ; 183: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53a96d5c86c9e194, ; 184: System.Net.NetworkInformation => 135
	i64 u0x53c3014b9437e684, ; 185: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x5435e6f049e9bc37, ; 186: System.Security.Claims.dll => 158
	i64 u0x54795225dd1587af, ; 187: lib_System.Runtime.dll.so => 157
	i64 u0x556e8b63b660ab8b, ; 188: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 84
	i64 u0x5588627c9a108ec9, ; 189: System.Collections.Specialized => 108
	i64 u0x571c5cfbec5ae8e2, ; 190: System.Private.Uri => 144
	i64 u0x579a06fed6eec900, ; 191: System.Private.CoreLib.dll => 183
	i64 u0x57c542c14049b66d, ; 192: System.Diagnostics.DiagnosticSource => 117
	i64 u0x58601b2dda4a27b9, ; 193: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 194: Microsoft.Extensions.DependencyInjection.dll => 49
	i64 u0x595a356d23e8da9a, ; 195: lib_Microsoft.CSharp.dll.so => 104
	i64 u0x5a89a886ae30258d, ; 196: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 78
	i64 u0x5a8f6699f4a1caa9, ; 197: lib_System.Threading.dll.so => 174
	i64 u0x5ae9cd33b15841bf, ; 198: System.ComponentModel => 114
	i64 u0x5b5f0e240a06a2a2, ; 199: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5b608c01082a90a8, ; 200: K4os.Hash.xxHash => 44
	i64 u0x5c393624b8176517, ; 201: lib_Microsoft.Extensions.Logging.dll.so => 54
	i64 u0x5d0a4a29b02d9d3c, ; 202: System.Net.WebHeaderCollection.dll => 141
	i64 u0x5db0cbbd1028510e, ; 203: lib_System.Runtime.InteropServices.dll.so => 151
	i64 u0x5db30905d3e5013b, ; 204: Xamarin.AndroidX.Collection.Jvm.dll => 77
	i64 u0x5e467bc8f09ad026, ; 205: System.Collections.Specialized.dll => 108
	i64 u0x5ea92fdb19ec8c4c, ; 206: System.Text.Encodings.Web.dll => 168
	i64 u0x5eb8046dd40e9ac3, ; 207: System.ComponentModel.Primitives => 112
	i64 u0x5ec272d219c9aba4, ; 208: System.Security.Cryptography.Csp.dll => 160
	i64 u0x5f36ccf5c6a57e24, ; 209: System.Xml.ReaderWriter.dll => 178
	i64 u0x5f4294b9b63cb842, ; 210: System.Data.Common => 116
	i64 u0x5f9a2d823f664957, ; 211: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x5fac98e0b37a5b9d, ; 212: System.Runtime.CompilerServices.Unsafe.dll => 150
	i64 u0x609f4b7b63d802d4, ; 213: lib_Microsoft.Extensions.DependencyInjection.dll.so => 49
	i64 u0x60cd4e33d7e60134, ; 214: Xamarin.KotlinX.Coroutines.Core.Jvm => 100
	i64 u0x60f62d786afcf130, ; 215: System.Memory => 131
	i64 u0x618073e67851e2a7, ; 216: lib_K4os.Compression.LZ4.Streams.dll.so => 43
	i64 u0x61be8d1299194243, ; 217: Microsoft.Maui.Controls.Xaml => 60
	i64 u0x61d2cba29557038f, ; 218: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x61d88f399afb2f45, ; 219: lib_System.Runtime.Loader.dll.so => 153
	i64 u0x622eef6f9e59068d, ; 220: System.Private.CoreLib => 183
	i64 u0x6400f68068c1e9f1, ; 221: Xamarin.Google.Android.Material.dll => 98
	i64 u0x640e3b14dbd325c2, ; 222: System.Security.Cryptography.Algorithms.dll => 159
	i64 u0x65a51fb1cf95ad53, ; 223: ZstdSharp.dll => 102
	i64 u0x65ecac39144dd3cc, ; 224: Microsoft.Maui.Controls.dll => 59
	i64 u0x65ece51227bfa724, ; 225: lib_System.Runtime.Numerics.dll.so => 154
	i64 u0x6668e5c50e448662, ; 226: EPPlus => 36
	i64 u0x6692e924eade1b29, ; 227: lib_System.Console.dll.so => 115
	i64 u0x66a4e5c6a3fb0bae, ; 228: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 86
	i64 u0x66ad21286ac74b9d, ; 229: lib_System.Drawing.Common.dll.so => 69
	i64 u0x66d13304ce1a3efa, ; 230: Xamarin.AndroidX.CursorAdapter => 80
	i64 u0x68558ec653afa616, ; 231: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x6872ec7a2e36b1ac, ; 232: System.Drawing.Primitives.dll => 122
	i64 u0x68fbbbe2eb455198, ; 233: System.Formats.Asn1 => 124
	i64 u0x69063fc0ba8e6bdd, ; 234: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x6a4d7577b2317255, ; 235: System.Runtime.InteropServices.dll => 151
	i64 u0x6ace3b74b15ee4a4, ; 236: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6d0a12b2adba20d8, ; 237: System.Security.Cryptography.ProtectedData.dll => 71
	i64 u0x6d12bfaa99c72b1f, ; 238: lib_Microsoft.Maui.Graphics.dll.so => 63
	i64 u0x6d70755158ca866e, ; 239: lib_System.ComponentModel.EventBasedAsync.dll.so => 111
	i64 u0x6d79993361e10ef2, ; 240: Microsoft.Extensions.Primitives => 57
	i64 u0x6d86d56b84c8eb71, ; 241: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 80
	i64 u0x6d9bea6b3e895cf7, ; 242: Microsoft.Extensions.Primitives.dll => 57
	i64 u0x6e25a02c3833319a, ; 243: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 90
	i64 u0x6fd2265da78b93a4, ; 244: lib_Microsoft.Maui.dll.so => 61
	i64 u0x6fdfc7de82c33008, ; 245: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x6ffc4967cc47ba57, ; 246: System.IO.FileSystem.Watcher.dll => 127
	i64 u0x70e99f48c05cb921, ; 247: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 248: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x71a495ea3761dde8, ; 249: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 250: System.ComponentModel.Primitives.dll => 112
	i64 u0x71bc142d620e986a, ; 251: lib_System.Security.Cryptography.Pkcs.dll.so => 70
	i64 u0x725f5a9e82a45c81, ; 252: System.Security.Cryptography.Encoding => 161
	i64 u0x72b1fb4109e08d7b, ; 253: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x73e4ce94e2eb6ffc, ; 254: lib_System.Memory.dll.so => 131
	i64 u0x755a91767330b3d4, ; 255: lib_Microsoft.Extensions.Configuration.dll.so => 45
	i64 u0x76012e7334db86e5, ; 256: lib_Xamarin.AndroidX.SavedState.dll.so => 94
	i64 u0x76ca07b878f44da0, ; 257: System.Runtime.Numerics.dll => 154
	i64 u0x777b4ed432c1e61e, ; 258: K4os.Compression.LZ4.Streams => 43
	i64 u0x779f67ad3b8efbd5, ; 259: Microsoft.Extensions.Configuration.Json.dll => 48
	i64 u0x780bc73597a503a9, ; 260: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 261: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x7841c47b741b9f64, ; 262: System.Security.Permissions => 72
	i64 u0x78a45e51311409b6, ; 263: Xamarin.AndroidX.Fragment.dll => 83
	i64 u0x7adb8da2ac89b647, ; 264: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7bef86a4335c4870, ; 265: System.ComponentModel.TypeConverter => 113
	i64 u0x7c0820144cd34d6a, ; 266: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 267: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7c41d387501568ba, ; 268: System.Net.WebClient.dll => 140
	i64 u0x7d649b75d580bb42, ; 269: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7d8ee2bdc8e3aad1, ; 270: System.Numerics.Vectors => 142
	i64 u0x7dfc3d6d9d8d7b70, ; 271: System.Collections => 109
	i64 u0x7e1f8f575a3599cb, ; 272: BouncyCastle.Cryptography.dll => 35
	i64 u0x7e2e564fa2f76c65, ; 273: lib_System.Diagnostics.Tracing.dll.so => 121
	i64 u0x7e302e110e1e1346, ; 274: lib_System.Security.Claims.dll.so => 158
	i64 u0x7e946809d6008ef2, ; 275: lib_System.ObjectModel.dll.so => 143
	i64 u0x7ecc13347c8fd849, ; 276: lib_System.ComponentModel.dll.so => 114
	i64 u0x7f00ddd9b9ca5a13, ; 277: Xamarin.AndroidX.ViewPager.dll => 96
	i64 u0x7f9351cd44b1273f, ; 278: Microsoft.Extensions.Configuration.Abstractions => 46
	i64 u0x7fbd557c99b3ce6f, ; 279: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 85
	i64 u0x812c069d5cdecc17, ; 280: System.dll => 181
	i64 u0x81ab745f6c0f5ce6, ; 281: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x82075fdf49c26af2, ; 282: ZstdSharp => 102
	i64 u0x8277f2be6b5ce05f, ; 283: Xamarin.AndroidX.AppCompat => 74
	i64 u0x828f06563b30bc50, ; 284: lib_Xamarin.AndroidX.CardView.dll.so => 76
	i64 u0x82df8f5532a10c59, ; 285: lib_System.Drawing.dll.so => 123
	i64 u0x82f6403342e12049, ; 286: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x83c14ba66c8e2b8c, ; 287: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x8478602014b59199, ; 288: lib_EPPlus.System.Drawing.dll.so => 38
	i64 u0x86a909228dc7657b, ; 289: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 290: Microsoft.Extensions.Configuration.dll => 45
	i64 u0x8704193f462e892e, ; 291: lib_Microsoft.Extensions.FileSystemGlobbing.dll.so => 53
	i64 u0x87c69b87d9283884, ; 292: lib_System.Threading.Thread.dll.so => 172
	i64 u0x87f6569b25707834, ; 293: System.IO.Compression.Brotli.dll => 125
	i64 u0x8842b3a5d2d3fb36, ; 294: Microsoft.Maui.Essentials => 62
	i64 u0x88bda98e0cffb7a9, ; 295: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 100
	i64 u0x8930322c7bd8f768, ; 296: netstandard => 182
	i64 u0x897a606c9e39c75f, ; 297: lib_System.ComponentModel.Primitives.dll.so => 112
	i64 u0x8ad229ea26432ee2, ; 298: Xamarin.AndroidX.Loader => 88
	i64 u0x8b4ff5d0fdd5faa1, ; 299: lib_System.Diagnostics.DiagnosticSource.dll.so => 117
	i64 u0x8b541d476eb3774c, ; 300: System.Security.Principal.Windows => 165
	i64 u0x8b8d01333a96d0b5, ; 301: System.Diagnostics.Process.dll => 118
	i64 u0x8b9ceca7acae3451, ; 302: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8c1bafb2ed25af5b, ; 303: K4os.Compression.LZ4.Streams.dll => 43
	i64 u0x8c575135aa1ccef4, ; 304: Microsoft.Extensions.FileProviders.Abstractions => 51
	i64 u0x8cdfdb4ce85fb925, ; 305: lib_System.Security.Principal.Windows.dll.so => 165
	i64 u0x8d0f420977c2c1c7, ; 306: Xamarin.AndroidX.CursorAdapter.dll => 80
	i64 u0x8d7b8ab4b3310ead, ; 307: System.Threading => 174
	i64 u0x8da188285aadfe8e, ; 308: System.Collections.Concurrent => 106
	i64 u0x8ec6e06a61c1baeb, ; 309: lib_Newtonsoft.Json.dll.so => 65
	i64 u0x8ed3cdd722b4d782, ; 310: System.Diagnostics.EventLog => 68
	i64 u0x8ed807bfe9858dfc, ; 311: Xamarin.AndroidX.Navigation.Common => 89
	i64 u0x8ee08b8194a30f48, ; 312: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef7601039857a44, ; 313: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8f32c6f611f6ffab, ; 314: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 315: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x90263f8448b8f572, ; 316: lib_System.Diagnostics.TraceSource.dll.so => 120
	i64 u0x903101b46fb73a04, ; 317: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 318: lib_System.IO.Compression.dll.so => 126
	i64 u0x90634f86c5ebe2b5, ; 319: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 86
	i64 u0x907b636704ad79ef, ; 320: lib_Microsoft.Maui.Controls.Xaml.dll.so => 60
	i64 u0x91418dc638b29e68, ; 321: lib_Xamarin.AndroidX.CustomView.dll.so => 81
	i64 u0x914647982e998267, ; 322: Microsoft.Extensions.Configuration.Json => 48
	i64 u0x9157bd523cd7ed36, ; 323: lib_System.Text.Json.dll.so => 169
	i64 u0x91a74f07b30d37e2, ; 324: System.Linq.dll => 130
	i64 u0x91fa41a87223399f, ; 325: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x93cfa73ab28d6e35, ; 326: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 327: System.IO.Compression.dll => 126
	i64 u0x967fc325e09bfa8c, ; 328: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9732d8dbddea3d9a, ; 329: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 330: Microsoft.Maui.Graphics.dll => 63
	i64 u0x97b8c771ea3e4220, ; 331: System.ComponentModel.dll => 114
	i64 u0x97e144c9d3c6976e, ; 332: System.Collections.Concurrent.dll => 106
	i64 u0x991d510397f92d9d, ; 333: System.Linq.Expressions => 129
	i64 u0x99868af5d93ecaeb, ; 334: lib_K4os.Hash.xxHash.dll.so => 44
	i64 u0x99a00ca5270c6878, ; 335: Xamarin.AndroidX.Navigation.Runtime => 91
	i64 u0x99cdc6d1f2d3a72f, ; 336: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9a816d9654deff7c, ; 337: Microsoft.IO.RecyclableMemoryStream => 58
	i64 u0x9b211a749105beac, ; 338: System.Transactions.Local => 175
	i64 u0x9c244ac7cda32d26, ; 339: System.Security.Cryptography.X509Certificates.dll => 163
	i64 u0x9d5dbcf5a48583fe, ; 340: lib_Xamarin.AndroidX.Activity.dll.so => 73
	i64 u0x9d74dee1a7725f34, ; 341: Microsoft.Extensions.Configuration.Abstractions.dll => 46
	i64 u0x9e4534b6adaf6e84, ; 342: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9eaf1efdf6f7267e, ; 343: Xamarin.AndroidX.Navigation.Common.dll => 89
	i64 u0x9ef542cf1f78c506, ; 344: Xamarin.AndroidX.Lifecycle.LiveData.Core => 85
	i64 u0x9fbb2961ca18e5c2, ; 345: Microsoft.Extensions.FileProviders.Physical.dll => 52
	i64 u0xa0d8259f4cc284ec, ; 346: lib_System.Security.Cryptography.dll.so => 164
	i64 u0xa1440773ee9d341e, ; 347: Xamarin.Google.Android.Material => 98
	i64 u0xa1b9d7c27f47219f, ; 348: Xamarin.AndroidX.Navigation.UI.dll => 92
	i64 u0xa2572680829d2c7c, ; 349: System.IO.Pipelines.dll => 128
	i64 u0xa3c64c49e90a9987, ; 350: System.Security.Cryptography.Pkcs => 70
	i64 u0xa46aa1eaa214539b, ; 351: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa4edc8f2ceae241a, ; 352: System.Data.Common.dll => 116
	i64 u0xa5494f40f128ce6a, ; 353: System.Runtime.Serialization.Formatters.dll => 155
	i64 u0xa5b7152421ed6d98, ; 354: lib_System.IO.FileSystem.Watcher.dll.so => 127
	i64 u0xa5ce5c755bde8cb8, ; 355: lib_System.Security.Cryptography.Csp.dll.so => 160
	i64 u0xa5e599d1e0524750, ; 356: System.Numerics.Vectors.dll => 142
	i64 u0xa5f1ba49b85dd355, ; 357: System.Security.Cryptography.dll => 164
	i64 u0xa61975a5a37873ea, ; 358: lib_System.Xml.XmlSerializer.dll.so => 180
	i64 u0xa64476a892d76457, ; 359: lib_MySql.Data.dll.so => 64
	i64 u0xa67dbee13e1df9ca, ; 360: Xamarin.AndroidX.SavedState.dll => 94
	i64 u0xa68a420042bb9b1f, ; 361: Xamarin.AndroidX.DrawerLayout.dll => 82
	i64 u0xa763fbb98df8d9fb, ; 362: lib_Microsoft.Win32.Primitives.dll.so => 105
	i64 u0xa78ce3745383236a, ; 363: Xamarin.AndroidX.Lifecycle.Common.Jvm => 84
	i64 u0xa7c31b56b4dc7b33, ; 364: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xa82fd211eef00a5b, ; 365: Microsoft.Extensions.FileProviders.Physical => 52
	i64 u0xaa2219c8e3449ff5, ; 366: Microsoft.Extensions.Logging.Abstractions => 55
	i64 u0xaa443ac34067eeef, ; 367: System.Private.Xml.dll => 146
	i64 u0xaa52de307ef5d1dd, ; 368: System.Net.Http => 133
	i64 u0xaaaf86367285a918, ; 369: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 50
	i64 u0xaaf22ea2d6123a3f, ; 370: lib_ExcelDataReader.dll.so => 39
	i64 u0xaaf84bb3f052a265, ; 371: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xab9c1b2687d86b0b, ; 372: lib_System.Linq.Expressions.dll.so => 129
	i64 u0xabe040529690b3a1, ; 373: EPPlus.System.Drawing => 38
	i64 u0xac2af3fa195a15ce, ; 374: System.Runtime.Numerics => 154
	i64 u0xac5376a2a538dc10, ; 375: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 85
	i64 u0xac65e40f62b6b90e, ; 376: Google.Protobuf => 41
	i64 u0xac79c7e46047ad98, ; 377: System.Security.Principal.Windows.dll => 165
	i64 u0xac98d31068e24591, ; 378: System.Xml.XDocument => 179
	i64 u0xacd46e002c3ccb97, ; 379: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xacf42eea7ef9cd12, ; 380: System.Threading.Channels => 171
	i64 u0xad89c07347f1bad6, ; 381: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 382: System.Web.HttpUtility => 176
	i64 u0xadc90ab061a9e6e4, ; 383: System.ComponentModel.TypeConverter.dll => 113
	i64 u0xadf511667bef3595, ; 384: System.Net.Security => 138
	i64 u0xae031e1cb05086cb, ; 385: lib_EPPlus.Interfaces.dll.so => 37
	i64 u0xae0aaa94fdcfce0f, ; 386: System.ComponentModel.EventBasedAsync.dll => 111
	i64 u0xae282bcd03739de7, ; 387: Java.Interop => 184
	i64 u0xae53579c90db1107, ; 388: System.ObjectModel.dll => 143
	i64 u0xafe29f45095518e7, ; 389: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 87
	i64 u0xb05b6f0a6cc8ddbb, ; 390: lib_Microsoft.IO.RecyclableMemoryStream.dll.so => 58
	i64 u0xb05cc42cd94c6d9d, ; 391: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb0bb43dc52ea59f9, ; 392: System.Diagnostics.Tracing.dll => 121
	i64 u0xb1eef5a679d400a6, ; 393: lib_ExcelDataReader.DataSet.dll.so => 40
	i64 u0xb220631954820169, ; 394: System.Text.RegularExpressions => 170
	i64 u0xb2376e1dbf8b4ed7, ; 395: System.Security.Cryptography.Csp => 160
	i64 u0xb2a3f67f3bf29fce, ; 396: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb31efb7ff1c40e7a, ; 397: EPPlus.dll => 36
	i64 u0xb398860d6ed7ba2f, ; 398: System.Security.Cryptography.ProtectedData => 71
	i64 u0xb3f0a0fcda8d3ebc, ; 399: Xamarin.AndroidX.CardView => 76
	i64 u0xb46be1aa6d4fff93, ; 400: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 401: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 402: System.IO.Pipelines => 128
	i64 u0xb5c7fcdafbc67ee4, ; 403: Microsoft.Extensions.Logging.Abstractions.dll => 55
	i64 u0xb5ea31d5244c6626, ; 404: System.Threading.ThreadPool.dll => 173
	i64 u0xb7212c4683a94afe, ; 405: System.Drawing.Primitives => 122
	i64 u0xb7b7753d1f319409, ; 406: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 407: lib_System.Private.CoreLib.dll.so => 183
	i64 u0xb9185c33a1643eed, ; 408: Microsoft.CSharp.dll => 104
	i64 u0xb9f64d3b230def68, ; 409: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 410: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba4670aa94a2b3c6, ; 411: lib_System.Xml.XDocument.dll.so => 179
	i64 u0xba48785529705af9, ; 412: System.Collections.dll => 109
	i64 u0xbadbc0a44214b54e, ; 413: K4os.Compression.LZ4 => 42
	i64 u0xbb65706fde942ce3, ; 414: System.Net.Sockets => 139
	i64 u0xbbd180354b67271a, ; 415: System.Runtime.Serialization.Formatters => 155
	i64 u0xbd0e2c0d55246576, ; 416: System.Net.Http.dll => 133
	i64 u0xbd437a2cdb333d0d, ; 417: Xamarin.AndroidX.ViewPager2 => 97
	i64 u0xbd877b14d0b56392, ; 418: System.Runtime.Intrinsics.dll => 152
	i64 u0xbee1b395605474f1, ; 419: System.Drawing.Common.dll => 69
	i64 u0xbee38d4a88835966, ; 420: Xamarin.AndroidX.AppCompat.AppCompatResources => 75
	i64 u0xbfc1e1fb3095f2b3, ; 421: lib_System.Net.Http.Json.dll.so => 132
	i64 u0xc040a4ab55817f58, ; 422: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc06b03dc11addc5c, ; 423: OLT.Extensions.EPPlus.dll => 66
	i64 u0xc0d928351ab5ca77, ; 424: System.Console.dll => 115
	i64 u0xc0f5a221a9383aea, ; 425: System.Runtime.Intrinsics => 152
	i64 u0xc12b8b3afa48329c, ; 426: lib_System.Linq.dll.so => 130
	i64 u0xc1ff9ae3cdb6e1e6, ; 427: Xamarin.AndroidX.Activity.dll => 73
	i64 u0xc2260e1da1054ac1, ; 428: lib_BouncyCastle.Cryptography.dll.so => 35
	i64 u0xc256638aedbc4a74, ; 429: EPPlus.Interfaces => 37
	i64 u0xc28c50f32f81cc73, ; 430: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2a3bca55b573141, ; 431: System.IO.FileSystem.Watcher => 127
	i64 u0xc2bcfec99f69365e, ; 432: Xamarin.AndroidX.ViewPager2.dll => 97
	i64 u0xc34594968e1731d2, ; 433: MauiApp_Interfaz.dll => 103
	i64 u0xc4d3858ed4d08512, ; 434: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 87
	i64 u0xc50fded0ded1418c, ; 435: lib_System.ComponentModel.TypeConverter.dll.so => 113
	i64 u0xc519125d6bc8fb11, ; 436: lib_System.Net.Requests.dll.so => 137
	i64 u0xc5293b19e4dc230e, ; 437: Xamarin.AndroidX.Navigation.Fragment => 90
	i64 u0xc5325b2fcb37446f, ; 438: lib_System.Private.Xml.dll.so => 146
	i64 u0xc5a0f4b95a699af7, ; 439: lib_System.Private.Uri.dll.so => 144
	i64 u0xc5cdcd5b6277579e, ; 440: lib_System.Security.Cryptography.Algorithms.dll.so => 159
	i64 u0xc659b586d4c229e2, ; 441: Microsoft.Extensions.Configuration.FileExtensions.dll => 47
	i64 u0xc6a4665a88c57225, ; 442: lib_ZstdSharp.dll.so => 102
	i64 u0xc7c01e7d7c93a110, ; 443: System.Text.Encoding.Extensions.dll => 167
	i64 u0xc7ce851898a4548e, ; 444: lib_System.Web.HttpUtility.dll.so => 176
	i64 u0xc858a28d9ee5a6c5, ; 445: lib_System.Collections.Specialized.dll.so => 108
	i64 u0xc8629a6f7ae4f577, ; 446: ExcelDataReader.dll => 39
	i64 u0xc9c62c8f354ac568, ; 447: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 119
	i64 u0xca3a723e7342c5b6, ; 448: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xcab3493c70141c2d, ; 449: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 450: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcbd4fdd9cef4a294, ; 451: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc263933dd08cfd8, ; 452: ExcelDataReader.DataSet.dll => 40
	i64 u0xcc2876b32ef2794c, ; 453: lib_System.Text.RegularExpressions.dll.so => 170
	i64 u0xcc5c3bb714c4561e, ; 454: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 100
	i64 u0xcc76886e09b88260, ; 455: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 101
	i64 u0xccf25c4b634ccd3a, ; 456: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 457: System.Net.Requests => 137
	i64 u0xcdd0c48b6937b21c, ; 458: Xamarin.AndroidX.SwipeRefreshLayout => 95
	i64 u0xcf23d8093f3ceadf, ; 459: System.Diagnostics.DiagnosticSource.dll => 117
	i64 u0xcf8fc898f98b0d34, ; 460: System.Private.Xml.Linq => 145
	i64 u0xd0de8a113e976700, ; 461: System.Diagnostics.TextWriterTraceListener => 119
	i64 u0xd1194e1d8a8de83c, ; 462: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 84
	i64 u0xd22a0c4630f2fe66, ; 463: lib_System.Security.Cryptography.ProtectedData.dll.so => 71
	i64 u0xd333d0af9e423810, ; 464: System.Runtime.InteropServices => 151
	i64 u0xd33a415cb4278969, ; 465: System.Security.Cryptography.Encoding.dll => 161
	i64 u0xd3426d966bb704f5, ; 466: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 75
	i64 u0xd3651b6fc3125825, ; 467: System.Private.Uri.dll => 144
	i64 u0xd373685349b1fe8b, ; 468: Microsoft.Extensions.Logging.dll => 54
	i64 u0xd3e4c8d6a2d5d470, ; 469: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd4645626dffec99d, ; 470: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 50
	i64 u0xd5507e11a2b2839f, ; 471: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 87
	i64 u0xd561e0267e659d4d, ; 472: ExcelDataReader => 39
	i64 u0xd6263a9733fe5805, ; 473: OLT.Extensions.EPPlus => 66
	i64 u0xd6694f8359737e4e, ; 474: Xamarin.AndroidX.SavedState => 94
	i64 u0xd6d21782156bc35b, ; 475: Xamarin.AndroidX.SwipeRefreshLayout.dll => 95
	i64 u0xd72329819cbbbc44, ; 476: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 46
	i64 u0xd72c760af136e863, ; 477: System.Xml.XmlSerializer.dll => 180
	i64 u0xd7b3764ada9d341d, ; 478: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 55
	i64 u0xd9e245a1762ddad5, ; 479: BouncyCastle.Cryptography => 35
	i64 u0xda1dfa4c534a9251, ; 480: Microsoft.Extensions.DependencyInjection => 49
	i64 u0xdad05a11827959a3, ; 481: System.Collections.NonGeneric.dll => 107
	i64 u0xdb5383ab5865c007, ; 482: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdb58816721c02a59, ; 483: lib_System.Reflection.Emit.ILGeneration.dll.so => 147
	i64 u0xdbeda89f832aa805, ; 484: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf2a779fbc3ac31, ; 485: System.Transactions.Local.dll => 175
	i64 u0xdbf9607a441b4505, ; 486: System.Linq => 130
	i64 u0xdc75032002d1a212, ; 487: lib_System.Transactions.Local.dll.so => 175
	i64 u0xdce2c53525640bf3, ; 488: Microsoft.Extensions.Logging => 54
	i64 u0xdd2b722d78ef5f43, ; 489: System.Runtime.dll => 157
	i64 u0xdd67031857c72f96, ; 490: lib_System.Text.Encodings.Web.dll.so => 168
	i64 u0xdde30e6b77aa6f6c, ; 491: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xde110ae80fa7c2e2, ; 492: System.Xml.XDocument.dll => 179
	i64 u0xde8769ebda7d8647, ; 493: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xdf35b6d818902893, ; 494: K4os.Hash.xxHash.dll => 44
	i64 u0xe0142572c095a480, ; 495: Xamarin.AndroidX.AppCompat.dll => 74
	i64 u0xe02f89350ec78051, ; 496: Xamarin.AndroidX.CoordinatorLayout.dll => 78
	i64 u0xe10b760bb1462e7a, ; 497: lib_System.Security.Cryptography.Primitives.dll.so => 162
	i64 u0xe192a588d4410686, ; 498: lib_System.IO.Pipelines.dll.so => 128
	i64 u0xe1a08bd3fa539e0d, ; 499: System.Runtime.Loader => 153
	i64 u0xe1b52f9f816c70ef, ; 500: System.Private.Xml.Linq.dll => 145
	i64 u0xe1ecfdb7fff86067, ; 501: System.Net.Security.dll => 138
	i64 u0xe22fa4c9c645db62, ; 502: System.Diagnostics.TextWriterTraceListener.dll => 119
	i64 u0xe2420585aeceb728, ; 503: System.Net.Requests.dll => 137
	i64 u0xe29b73bc11392966, ; 504: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe2e426c7714fa0bc, ; 505: Microsoft.Win32.Primitives.dll => 105
	i64 u0xe3811d68d4fe8463, ; 506: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe3b7cbae5ad66c75, ; 507: lib_System.Security.Cryptography.Encoding.dll.so => 161
	i64 u0xe494f7ced4ecd10a, ; 508: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 509: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe4f74a0b5bf9703f, ; 510: System.Runtime.Serialization.Primitives => 156
	i64 u0xe5434e8a119ceb69, ; 511: lib_Mono.Android.dll.so => 186
	i64 u0xe57d22ca4aeb4900, ; 512: System.Configuration.ConfigurationManager => 67
	i64 u0xe89a2a9ef110899b, ; 513: System.Drawing.dll => 123
	i64 u0xed6ef763c6fb395f, ; 514: System.Diagnostics.EventLog.dll => 68
	i64 u0xedc4817167106c23, ; 515: System.Net.Sockets.dll => 139
	i64 u0xedc632067fb20ff3, ; 516: System.Memory.dll => 131
	i64 u0xedc8e4ca71a02a8b, ; 517: Xamarin.AndroidX.Navigation.Runtime.dll => 91
	i64 u0xee81f5b3f1c4f83b, ; 518: System.Threading.ThreadPool => 173
	i64 u0xeeb7ebb80150501b, ; 519: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 77
	i64 u0xef03b1b5a04e9709, ; 520: System.Text.Encoding.CodePages.dll => 166
	i64 u0xef72742e1bcca27a, ; 521: Microsoft.Maui.Essentials.dll => 62
	i64 u0xefec0b7fdc57ec42, ; 522: Xamarin.AndroidX.Activity => 73
	i64 u0xf00c29406ea45e19, ; 523: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf09e47b6ae914f6e, ; 524: System.Net.NameResolution => 134
	i64 u0xf0de2537ee19c6ca, ; 525: lib_System.Net.WebHeaderCollection.dll.so => 141
	i64 u0xf11b621fc87b983f, ; 526: Microsoft.Maui.Controls.Xaml.dll => 60
	i64 u0xf1c4b4005493d871, ; 527: System.Formats.Asn1.dll => 124
	i64 u0xf238bd79489d3a96, ; 528: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 529: lib_Xamarin.Google.Android.Material.dll.so => 98
	i64 u0xf3ddfe05336abf29, ; 530: System => 181
	i64 u0xf408654b2a135055, ; 531: System.Reflection.Emit.ILGeneration.dll => 147
	i64 u0xf4c1dd70a5496a17, ; 532: System.IO.Compression => 126
	i64 u0xf5fc7602fe27b333, ; 533: System.Net.WebHeaderCollection => 141
	i64 u0xf6077741019d7428, ; 534: Xamarin.AndroidX.CoordinatorLayout => 78
	i64 u0xf6de7fa3776f8927, ; 535: lib_Microsoft.Extensions.Configuration.Json.dll.so => 48
	i64 u0xf77b20923f07c667, ; 536: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7e2cac4c45067b3, ; 537: lib_System.Numerics.Vectors.dll.so => 142
	i64 u0xf7e74930e0e3d214, ; 538: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf7fa0bf77fe677cc, ; 539: Newtonsoft.Json.dll => 65
	i64 u0xf84773b5c81e3cef, ; 540: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8b77539b362d3ba, ; 541: lib_System.Reflection.Primitives.dll.so => 149
	i64 u0xf8e045dc345b2ea3, ; 542: lib_Xamarin.AndroidX.RecyclerView.dll.so => 93
	i64 u0xf915dc29808193a1, ; 543: System.Web.HttpUtility.dll => 176
	i64 u0xf96c777a2a0686f4, ; 544: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xf9eec5bb3a6aedc6, ; 545: Microsoft.Extensions.Options => 56
	i64 u0xfa2fdb27e8a2c8e8, ; 546: System.ComponentModel.EventBasedAsync => 111
	i64 u0xfa3f278f288b0e84, ; 547: lib_System.Net.Security.dll.so => 138
	i64 u0xfa504dfa0f097d72, ; 548: Microsoft.Extensions.FileProviders.Abstractions.dll => 51
	i64 u0xfa5ed7226d978949, ; 549: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfa645d91e9fc4cba, ; 550: System.Threading.Thread => 172
	i64 u0xfbad3e4ce4b98145, ; 551: System.Security.Cryptography.X509Certificates => 163
	i64 u0xfbf0a31c9fc34bc4, ; 552: lib_System.Net.Http.dll.so => 133
	i64 u0xfc6b7527cc280b3f, ; 553: lib_System.Runtime.Serialization.Formatters.dll.so => 155
	i64 u0xfc719aec26adf9d9, ; 554: Xamarin.AndroidX.Navigation.Fragment.dll => 90
	i64 u0xfd22f00870e40ae0, ; 555: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 82
	i64 u0xfd536c702f64dc47, ; 556: System.Text.Encoding.Extensions => 167
	i64 u0xfd583f7657b6a1cb, ; 557: Xamarin.AndroidX.Fragment => 83
	i64 u0xfe9856c3af9365ab, ; 558: lib_Microsoft.Extensions.Configuration.FileExtensions.dll.so => 47
	i64 u0xfeae9952cf03b8cb, ; 559: tr/Microsoft.Maui.Controls.resources => 28
	i64 u0xff9b54613e0d2cc8 ; 560: System.Net.Http.Json => 132
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [561 x i32] [
	i32 95, i32 110, i32 91, i32 70, i32 185, i32 74, i32 58, i32 103,
	i32 24, i32 2, i32 30, i32 136, i32 93, i32 109, i32 61, i32 150,
	i32 31, i32 177, i32 77, i32 24, i32 107, i32 149, i32 82, i32 110,
	i32 56, i32 107, i32 164, i32 171, i32 40, i32 25, i32 101, i32 96,
	i32 21, i32 186, i32 62, i32 134, i32 81, i32 125, i32 162, i32 148,
	i32 42, i32 93, i32 69, i32 8, i32 184, i32 9, i32 50, i32 105,
	i32 68, i32 159, i32 182, i32 12, i32 168, i32 101, i32 38, i32 140,
	i32 18, i32 158, i32 106, i32 181, i32 27, i32 52, i32 185, i32 41,
	i32 92, i32 16, i32 56, i32 180, i32 140, i32 125, i32 72, i32 118,
	i32 36, i32 157, i32 147, i32 27, i32 66, i32 42, i32 172, i32 115,
	i32 79, i32 156, i32 8, i32 99, i32 57, i32 13, i32 11, i32 184,
	i32 136, i32 29, i32 135, i32 120, i32 103, i32 7, i32 170, i32 124,
	i32 33, i32 53, i32 37, i32 20, i32 166, i32 148, i32 145, i32 174,
	i32 26, i32 169, i32 5, i32 118, i32 178, i32 121, i32 83, i32 34,
	i32 76, i32 122, i32 8, i32 178, i32 53, i32 6, i32 139, i32 61,
	i32 2, i32 59, i32 110, i32 97, i32 45, i32 152, i32 148, i32 149,
	i32 150, i32 81, i32 134, i32 67, i32 96, i32 1, i32 65, i32 51,
	i32 162, i32 64, i32 167, i32 163, i32 99, i32 173, i32 177, i32 79,
	i32 41, i32 47, i32 64, i32 89, i32 67, i32 75, i32 182, i32 186,
	i32 20, i32 104, i32 156, i32 99, i32 120, i32 24, i32 177, i32 22,
	i32 72, i32 143, i32 92, i32 169, i32 132, i32 88, i32 135, i32 129,
	i32 146, i32 153, i32 14, i32 88, i32 185, i32 166, i32 171, i32 1,
	i32 59, i32 86, i32 123, i32 136, i32 116, i32 79, i32 63, i32 25,
	i32 135, i32 31, i32 158, i32 157, i32 84, i32 108, i32 144, i32 183,
	i32 117, i32 15, i32 49, i32 104, i32 78, i32 174, i32 114, i32 3,
	i32 44, i32 54, i32 141, i32 151, i32 77, i32 108, i32 168, i32 112,
	i32 160, i32 178, i32 116, i32 5, i32 150, i32 49, i32 100, i32 131,
	i32 43, i32 60, i32 4, i32 153, i32 183, i32 98, i32 159, i32 102,
	i32 59, i32 154, i32 36, i32 115, i32 86, i32 69, i32 80, i32 3,
	i32 122, i32 124, i32 9, i32 151, i32 18, i32 71, i32 63, i32 111,
	i32 57, i32 80, i32 57, i32 90, i32 61, i32 2, i32 127, i32 28,
	i32 18, i32 14, i32 112, i32 70, i32 161, i32 11, i32 131, i32 45,
	i32 94, i32 154, i32 43, i32 48, i32 17, i32 27, i32 72, i32 83,
	i32 7, i32 113, i32 25, i32 4, i32 140, i32 17, i32 142, i32 109,
	i32 35, i32 121, i32 158, i32 143, i32 114, i32 96, i32 46, i32 85,
	i32 181, i32 33, i32 102, i32 74, i32 76, i32 123, i32 29, i32 32,
	i32 38, i32 33, i32 45, i32 53, i32 172, i32 125, i32 62, i32 100,
	i32 182, i32 112, i32 88, i32 117, i32 165, i32 118, i32 9, i32 43,
	i32 51, i32 165, i32 80, i32 174, i32 106, i32 65, i32 68, i32 89,
	i32 10, i32 23, i32 22, i32 21, i32 120, i32 34, i32 126, i32 86,
	i32 60, i32 81, i32 48, i32 169, i32 130, i32 1, i32 17, i32 126,
	i32 6, i32 13, i32 63, i32 114, i32 106, i32 129, i32 44, i32 91,
	i32 16, i32 58, i32 175, i32 163, i32 73, i32 46, i32 19, i32 89,
	i32 85, i32 52, i32 164, i32 98, i32 92, i32 128, i32 70, i32 16,
	i32 116, i32 155, i32 127, i32 160, i32 142, i32 164, i32 180, i32 64,
	i32 94, i32 82, i32 105, i32 84, i32 12, i32 52, i32 55, i32 146,
	i32 133, i32 50, i32 39, i32 5, i32 129, i32 38, i32 154, i32 85,
	i32 41, i32 165, i32 179, i32 23, i32 171, i32 19, i32 176, i32 113,
	i32 138, i32 37, i32 111, i32 184, i32 143, i32 87, i32 58, i32 26,
	i32 121, i32 40, i32 170, i32 160, i32 3, i32 36, i32 71, i32 76,
	i32 10, i32 0, i32 128, i32 55, i32 173, i32 122, i32 26, i32 183,
	i32 104, i32 22, i32 15, i32 179, i32 109, i32 42, i32 139, i32 155,
	i32 133, i32 97, i32 152, i32 69, i32 75, i32 132, i32 0, i32 66,
	i32 115, i32 152, i32 130, i32 73, i32 35, i32 37, i32 15, i32 127,
	i32 97, i32 103, i32 87, i32 113, i32 137, i32 90, i32 146, i32 144,
	i32 159, i32 47, i32 102, i32 167, i32 176, i32 108, i32 39, i32 119,
	i32 28, i32 20, i32 23, i32 34, i32 40, i32 170, i32 100, i32 101,
	i32 32, i32 137, i32 95, i32 117, i32 145, i32 119, i32 84, i32 71,
	i32 151, i32 161, i32 75, i32 144, i32 54, i32 14, i32 50, i32 87,
	i32 39, i32 66, i32 94, i32 95, i32 46, i32 180, i32 55, i32 35,
	i32 49, i32 107, i32 30, i32 147, i32 30, i32 175, i32 130, i32 175,
	i32 54, i32 157, i32 168, i32 32, i32 179, i32 11, i32 44, i32 74,
	i32 78, i32 162, i32 128, i32 153, i32 145, i32 138, i32 119, i32 137,
	i32 13, i32 105, i32 21, i32 161, i32 12, i32 7, i32 156, i32 186,
	i32 67, i32 123, i32 68, i32 139, i32 131, i32 91, i32 173, i32 77,
	i32 166, i32 62, i32 73, i32 6, i32 134, i32 141, i32 60, i32 124,
	i32 19, i32 98, i32 181, i32 147, i32 126, i32 141, i32 78, i32 48,
	i32 4, i32 142, i32 31, i32 65, i32 29, i32 149, i32 93, i32 176,
	i32 10, i32 56, i32 111, i32 138, i32 51, i32 0, i32 172, i32 163,
	i32 133, i32 155, i32 90, i32 82, i32 167, i32 83, i32 47, i32 28,
	i32 132
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 0ccdc57cf7fc59bd3f6cbf900c9cdbebadfe4609"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
