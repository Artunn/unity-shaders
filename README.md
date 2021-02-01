<h1>Unity Shaders</h1>
This repository contains different kind of shaders with explanations. They will usually be from the <i>youtube tutorials</i> I watched, <i>articles</i>  I read or the things I learned during <i>CS 465 - Computer Graphics I</i> course.

<h3>Flat</h3>
In this shader fragment program returns the _Color property which is assigned from the Unity inspector. It doesn't make any further calculations, so whole object is that selected color.

<h3>Lambertian Shading</h3>
Lambertian shading uses object's normal and Light position to calculate a gradient coloring. It is important because it doesn't changes according to the viewer's position(If we had a specular component we would need that). As these two vectors gets closer in the opposite direction, we get a brighter color. All vectors and results are normalized between -1 and 1 so overexposure is allowed for further light settings.
