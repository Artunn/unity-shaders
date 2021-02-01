Shader "Artunn/Flat"{
	Properties{
		_Color("Color",Color) = (1.0,1.0,1.0,1.0)
	}
	SubShader{
		Pass{
			CGPROGRAM
			//No semicolons after vertex and fragment declarations
			#pragma vertex vertex_program
			#pragma fragment fragment_program
			
			uniform float4 _Color;

			struct appdata{
				float4 pos: POSITION;
			};

			struct v2f{
				float4 position: SV_POSITION;
			};

			v2f vertex_program(appdata input){
				v2f o;
				//Original positions only contains object's model coordinates. Object to clip position multiplies that coordinates with MVP to get homogenous coordinates.
				o.position = UnityObjectToClipPos(input.pos);
				return o;
			}

			float4 fragment_program(v2f o) : COLOR{
				return _Color;
			}

			ENDCG
		}
	}
}