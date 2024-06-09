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
	
	"Character":{
		"00": "Selecione o seu personagem"
	},
	
	"Config":
		{
			"00":"Configuração",
			"01":"Idioma",
			"02": "Dificuldade"
		},
		
		"Score":
		{
			"00":"Personagem",
			"01":"Pontos"
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
	},
	
	"Config":
		{
			"00":"Configuration",
			"01":"Languagem",
			"02": "Dificulty"
		},
	
	"Score":
		{
			"00":"Charactere",
			"01":"Score"
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
	},
	
	"Config":
		{
			"00":"Настройки",
			"01":"Язык",
			"02": "трудность"
		},
		
		"Score":
		{
			"00":"Характер",
			"01":"Характер"
		}
  }
}

func translate_game(idioma: String = "Brasil"):
	
	return frases[idioma]

func translate_game_path(caminho: String):
	
	var idioma = caminho.split(".")[0]
	var cena = caminho.split(".")[1]
	
	return frases[idioma][cena]
