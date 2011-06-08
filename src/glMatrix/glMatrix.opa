
type vec3.private = external;
type vec3 = (float, float, float);

type mat3 = external;
type mat4 = external;

vec3 = {{
     from_public : vec3 -> vec3.private = %% glMatrixPlugin.vec3_private_from_public %% ;
}}

mat3 = {{
     str : mat3 -> string = %% glMatrixPlugin.mat3_str %%
     create : -> mat3 = %% glMatrixPlugin.mat3_create %% ;
     transpose : mat3, mat3 -> void = %% glMatrixPlugin.mat3_transpose %% ;
     to_list : mat3 -> list(float) = %% glMatrixPlugin.mat3_to_list %% ;
}}

mat4 = {{
     to_list : mat4 -> list(float) = %% glMatrixPlugin.to_list %% ;
     str : mat4 -> string = %% glMatrixPlugin.str %%
     create : -> mat4 = %% glMatrixPlugin.create %% ;
     perspective : float, float, float, float, mat4 -> void = %% glMatrixPlugin.perspective %% ;
     identity : mat4 -> void = %% glMatrixPlugin.identity %% ;
     translate : mat4, vec3.private, mat4 -> void = %% glMatrixPlugin.translate %% ;
     lookAt : vec3.private, vec3.private, vec3.private, mat4 -> void = %% glMatrixPlugin.lookAt %% ;
     multiply : mat4, mat4, mat4 -> void = %% glMatrixPlugin.multiply %% ;
     toInverseMat3 : mat4, mat3 -> void = %% glMatrixPlugin.toInverseMat3 %% ;
}}
