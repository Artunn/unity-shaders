// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Artunn/Lambertian"{
	Properties{
		_Color("Color",color) = (1.0,1.0,1.0,1.0)
	}
	SubShader{
		Pass{
			Tags{ 
				"LightMode" = "ForwardBase"
			}
			CGPROGRAM
			#pragma vertex vertex_program
			#pragma fragment fragment_program

			uniform float4 _LightColor0;
			uniform float4 _Color;

			struct appdata{
				float4 position: POSITION;
				float3 normal: NORMAL;
			};

			struct v2f{
				float4 position: SV_POSITION;
				float4 color: COLOR;
			};

			v2f vertex_program(appdata a){
				v2f o;
				float3 normalDirection = normalize(mul(float4(a.normal,0.0),unity_WorldToObject)).xyz;
				float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
				float atten = 1.0;

				float3 diffuseReflection = atten * _Color.rgb * _LightColor0.xyz * max(0,dot(normalDirection,lightDirection));

				o.color = float4(diffuseReflection,1.0);
				o.position = UnityObjectToClipPos(a.position);
				return o;
			}

			float4 fragment_program(v2f v) : COLOR{
				return v.color;
			}
			ENDCG
		}
	}
}