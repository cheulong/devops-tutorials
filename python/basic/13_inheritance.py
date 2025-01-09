class GameCharacter:
    def __init__(self, name, life):
        self.name = name
        self.life = life
    def life_check(self):
        if self.life <= 0:
            print(self.name + " was defeated!")
        else:
            print(self.name + " is still in the fight.")

class Player(GameCharacter):
    def attack(self):
        print(self.name + " kicks the enemy!")

class Enemy(GameCharacter):
    def attack(self):
        print(self.name + " attack the hero!")

def attack_enemy(enemy, damage):
    print(enemy.name + " attacks")
    enemy.life -= damage
    print(enemy.name + " take " + str(damage) + " damage and has " + str(enemy.life) + " life remaining.")
    enemy.life_check()

def attack_player(player, damage):
    print(player.name + " attacks")
    player.life -= damage
    print(player.name + " take " + str(damage) + " damage and has " + str(player.life) + " life remaining.")
    player.life_check()

# Initialize player and enemy
enemy1 = Enemy("Goblin", 100)
player1 = Player("Alex", 100)

# Battle
attack_enemy(enemy1, 60)
attack_player(player1, 20)
attack_enemy(enemy1, 10)
attack_player(player1, 10)
attack_enemy(enemy1, 5)