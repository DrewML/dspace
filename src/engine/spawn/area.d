module engine.spawn.area;

import std.random;

import dsfml.graphics;
import star.entity;

import engine.spawn.spawner;

class SpawnArea : Spawner
{
    private FloatRect spawnArea;

    this(FloatRect pSpawnArea)
    {
        spawnArea = pSpawnArea;
    }

    private Vector2f getRandomPos()
    {
        float left, top;
        if (spawnArea.width <= 0.0f) {
            left = spawnArea.left;
        } else {
            left = uniform(spawnArea.left, spawnArea.left + spawnArea.width);
        }
        if (spawnArea.height <= 0.0f) {
            top = spawnArea.top;
        } else {
            top = uniform(spawnArea.top, spawnArea.top + spawnArea.height);
        }
        return Vector2f(left, top);
    }

    override void configureEntity(Entity entity, EntityDetails details)
    {
        details.position = getRandomPos();
        super.configureEntity(entity, details);
    }
}