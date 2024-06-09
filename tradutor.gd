extends Node

var frases = {
	
	"Brasil": {
		
		"Menu":{
		"00": "Iniciar Jogo",
		"01": "Personagem",
		"02": "Pontuação",
		"03": "sair"
	},
	
	"Game_over":
	{
		"00": "Fim de Jogo",
	},
	
	"Tutorial":{
		"00": "Tutorial do Jogo",
		"01": "Clique em enter para iniciar o jogo"
	},
	
	"Charactere":{
		"00": "Selecione o seu personagem"
	}
	
	},
	
	  "Ingles": {
	"Menu": {
	  "00": "Start Game",
	  "01": "Character",
	  "02": "Score",
	  "03": "Exit"
	},
	"Game_over": {
	  "00": "Game Over"
	},
	"Tutorial": {
	  "00": "Game Tutorial",
	  "01": "Click enter to start the game"
	},
	"Character": {
	  "00": "Select your character"
	}
  },

 "Russo": {
	"Menu": {
	  "00": "Начать игру",
	  "01": "Персонаж",
	  "02": "Очки",
	  "03": "Выход"
	},
	"Game_over": {
	  "00": "Конец игры"
	},
	"Tutorial": {
	  "00": "Обучение игре",
	  "01": "Нажмите Enter, чтобы начать игру"
	},
	"Character": {
	  "00": "Выберите своего персонажа"
	}
  }
}

func translate_game(idioma: String = "Brasil"):
	
	return frases[idioma]

func translate_game_path(caminho: String):
	
	var idioma = caminho.split(".")[0]
	var cena = caminho.split(".")[1]
	
	return frases[idioma][cena]
