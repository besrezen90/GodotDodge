extends RigidBody2D


export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.


#Сначала мы получаем список имён анимаций из свойства AnimatedSprite frames. 
#Это возвращает массив, содержащий все три имени анимации: ["walk", "swim", "fly"].

#Дальше нам нужно выбрать случайное число между 0 и 2, 
#чтобы выбрать имя одной из анимаций из списка (индексы массива начинаются с 0). 
#Функция randi() % n выбирает случайное целое число между 0 и n-1.
func _ready():
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	
	
#Последняя часть - заставить мобов удалять себя, когда они покидают экран. 
#Подключите сигнал screen exited() узла Visibility Notifier 2D и добавьте этот код:	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


