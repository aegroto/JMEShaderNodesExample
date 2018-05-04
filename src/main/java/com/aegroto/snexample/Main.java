package com.aegroto.snexample;

import com.jme3.app.SimpleApplication;
import com.jme3.input.KeyInput;
import com.jme3.input.controls.AnalogListener;
import com.jme3.input.controls.KeyTrigger;
import com.jme3.material.Material;
import com.jme3.math.FastMath;
import com.jme3.math.Quaternion;
import com.jme3.renderer.RenderManager;
import com.jme3.scene.Geometry;
import com.jme3.scene.shape.Box;
import com.jme3.texture.Texture;

public class Main extends SimpleApplication implements AnalogListener {
    private Material mat;
    private float meshScale = 1f;

    public static void main(String[] args) {
        Main app = new Main();
        app.setShowSettings(false);
        app.start();
    }

    @Override
    public void simpleInitApp() {
        flyCam.setMoveSpeed(20f);
        // Sphere b = new Sphere(150, 150, 2f);
        Box b = new Box(1, 1, 1);
        Geometry geom = new Geometry("Box", b);

        mat = new Material(assetManager, "naive material/Naive.j3md");
        Texture texture = assetManager.loadTexture("textures/monkey texture.png");
        texture.setWrap(Texture.WrapMode.Repeat);
        mat.setTexture("Tex", texture);

        mat.setFloat("TexScale", .35f);
        mat.setFloat("TransformSpeed", 2f);
        mat.setFloat("MeshScale", meshScale);

        geom.setMaterial(mat);

        rootNode.attachChild(geom);
        // geom.setLocalRotation(new Quaternion().fromAngles(-FastMath.QUARTER_PI, 0f, 0f));

        inputManager.addMapping("ScaleUp", new KeyTrigger(KeyInput.KEY_U));
        inputManager.addMapping("ScaleDown", new KeyTrigger(KeyInput.KEY_J));
        inputManager.addListener(this, "ScaleUp", "ScaleDown");
    }

    @Override
    public void onAnalog(String name, float value, float tpf) {
        switch(name) {
            case "ScaleUp" :
                meshScale += .1f;
                mat.setFloat("MeshScale", meshScale);
                break;
            case "ScaleDown" :
                if(meshScale > 0f) {
                    meshScale -= .1f;
                    mat.setFloat("MeshScale", meshScale);
                }
                break;
        }
    }

    @Override
    public void simpleUpdate(float tpf) { }

    @Override
    public void simpleRender(RenderManager rm) { }
}
