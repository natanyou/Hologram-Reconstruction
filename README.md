# Holography

**Holography** is a method that allows for the creation of 3D images by capturing both the intensity and phase information of light waves reflected from an object. This is different from traditional photography, which only captures the intensity of light. A hologram is a photographic recording of a light field, rather than an image formed by a lens.

**Key Components and Principles of Holography:**

**Coherent Light Source:**

Lasers are typically used in holography because they provide coherent light, which has a consistent phase relationship that is essential for creating clear interference patterns. Coherent light allows the capturing of both the amplitude (intensity) and the phase of the light waves.

**Interference and Diffraction:**

Interference is a fundamental principle in holography. When two coherent light waves meet, they interfere with each other, creating an interference pattern. This pattern is recorded on a photosensitive material (like photographic film or a digital sensor).
Diffraction occurs when a wave encounters an obstacle or a slit. The recorded interference pattern acts as a diffraction grating that can reconstruct the original light waves when illuminated with coherent light.

**Recording the Hologram:**

A hologram is recorded by splitting a laser beam into two parts: a reference beam and an object beam.
The object beam is directed onto the object. Light reflected from the object then interferes with the reference beam on a recording medium, such as photographic film or a digital sensor.
The resulting interference pattern is a hologram, which encodes both the amplitude and phase information of the light waves reflected from the object.

**Reconstructing the Hologram:**

To view the holographic image, the recorded hologram is illuminated with the same reference beam used during the recording process. The light diffracts according to the recorded interference pattern, reconstructing the original light field and creating a 3D image that appears to float in space.

________________________________________________________________________________________________

In the context of optoelectronics, holography refers to a technique for recording and reconstructing the light field of an object to create a three-dimensional image called a hologram. Optoelectronics is the field of technology that deals with the use and manipulation of light (photons) in electronic devices, and holography falls under this category because it involves the generation, transmission, and detection of optical signals.

________________________________________________________________________________________________

Here I give you 2 implementation of holography in **MATLAB**.

1.Restruction of image I adjust to the files **picture1.bpm** code **hoho_main.m**.
This picture was taken from a lab with phisical setup on table with those instruments:
**laser** for optical sorce , **Beam splitter** to split the light for **reference light** and light that reaches the **object** and both lights interference together on the **Pothographic Plate** in our case a camera.

Restruction of image I create in MATLAB as a binar matrix and imaginary reference light as matrix as well אo simulate the operation of holography using only code to simplify the problem. The code is **holo_with_our_images.m**.


