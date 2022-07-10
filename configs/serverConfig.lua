Auth = exports.plouffe_lib:Get("Auth")
Callback = exports.plouffe_lib:Get("Callback")

Server = {
	WebHook = "",
	LogWebHook = "",
	Init = false,
	BackupInfo = {},
	UsersReputations = {},
	Reputations = {
		prisoner = {
			name = "prisoner",
			label = "Les Prisoniers",
			maximum = 500,
			minimum = -200,
			levels = {
				hated = {
					minimum = -101,
					maximum = -200,
					label = "Detester"
				},
				enemies = {
					minimum = -1,
					maximum = -100,
					label = "Enemies"
				},
				unknown = {
					minimum = 0,
					maximum = 100,
					label = "Inconnue"
				},
				neutral = {
					minimum = 101,
					maximum = 200,
					label = "Neutre"
				},
				familiar = {
					minimum = 201,
					maximum = 300,
					label = "Familier"
				},
				friendly = {
					minimum = 301,
					maximum = 400,
					label = "Amical"
				},
				respect = {
					minimum = 401,
					maximum = 500,
					label = "Respecter"
				}
			}
		},
		taxi = {
			name = "taxi",
			label = "Taxi",
			maximum = 500,
			minimum = -200,
			levels = {
				hated = {
					minimum = -101,
					maximum = -200,
					label = "Detester"
				},
				enemies = {
					minimum = -1,
					maximum = -100,
					label = "Enemies"
				},
				unknown = {
					minimum = 0,
					maximum = 100,
					label = "Inconnue"
				},
				neutral = {
					minimum = 101,
					maximum = 200,
					label = "Neutre"
				},
				familiar = {
					minimum = 201,
					maximum = 300,
					label = "Familier"
				},
				friendly = {
					minimum = 301,
					maximum = 400,
					label = "Amical"
				},
				respect = {
					minimum = 401,
					maximum = 500,
					label = "Respecter"
				}
			}
		},
		fleuriste = {
			name = "fleuriste",
			label = "Fleuriste",
			maximum = 500,
			minimum = -200,
			levels = {
				hated = {
					minimum = -101,
					maximum = -200,
					label = "Detester"
				},
				enemies = {
					minimum = -1,
					maximum = -100,
					label = "Enemies"
				},
				unknown = {
					minimum = 0,
					maximum = 100,
					label = "Inconnue"
				},
				neutral = {
					minimum = 101,
					maximum = 200,
					label = "Neutre"
				},
				familiar = {
					minimum = 201,
					maximum = 300,
					label = "Familier"
				},
				friendly = {
					minimum = 301,
					maximum = 400,
					label = "Amical"
				},
				respect = {
					minimum = 401,
					maximum = 500,
					label = "Respecter"
				}
			}
		},
		diesel = {
			name = "diesel",
			label = "Diesel",
			maximum = 500,
			minimum = -200,
			levels = {
				hated = {
					minimum = -101,
					maximum = -200,
					label = "Detester"
				},
				enemies = {
					minimum = -1,
					maximum = -100,
					label = "Enemies"
				},
				unknown = {
					minimum = 0,
					maximum = 100,
					label = "Inconnue"
				},
				neutral = {
					minimum = 101,
					maximum = 200,
					label = "Neutre"
				},
				familiar = {
					minimum = 201,
					maximum = 300,
					label = "Familier"
				},
				friendly = {
					minimum = 301,
					maximum = 400,
					label = "Amical"
				},
				respect = {
					minimum = 401,
					maximum = 500,
					label = "Respecter"
				}
			}
		},
		allen = {
			name = "allen",
			label = "Allen",
			maximum = 500,
			minimum = -200,
			levels = {
				hated = {
					minimum = -101,
					maximum = -200,
					label = "Detester"
				},
				enemies = {
					minimum = -1,
					maximum = -100,
					label = "Enemies"
				},
				unknown = {
					minimum = 0,
					maximum = 100,
					label = "Inconnue"
				},
				neutral = {
					minimum = 101,
					maximum = 200,
					label = "Neutre"
				},
				familiar = {
					minimum = 201,
					maximum = 300,
					label = "Familier"
				},
				friendly = {
					minimum = 301,
					maximum = 400,
					label = "Amical"
				},
				respect = {
					minimum = 401,
					maximum = 500,
					label = "Respecter"
				}
			}
		},
		police = {
			name = "police",
			label = "Service de Police",
			maximum = 500,
			minimum = -200,
			levels = {
				hated = {
					minimum = -101,
					maximum = -200,
					label = "Detester"
				},
				enemies = {
					minimum = -1,
					maximum = -100,
					label = "Enemies"
				},
				unknown = {
					minimum = 0,
					maximum = 100,
					label = "Inconnue"
				},
				neutral = {
					minimum = 101,
					maximum = 200,
					label = "Neutre"
				},
				familiar = {
					minimum = 201,
					maximum = 300,
					label = "Familier"
				},
				friendly = {
					minimum = 301,
					maximum = 400,
					label = "Amical"
				},
				respect = {
					minimum = 401,
					maximum = 500,
					label = "Respecter"
				}
			}
		},
		ems = {
			name = "ems",
			label = "Service Ems",
			maximum = 500,
			minimum = -200,
			levels = {
				hated = {
					minimum = -101,
					maximum = -200,
					label = "Detester"
				},
				enemies = {
					minimum = -1,
					maximum = -100,
					label = "Enemies"
				},
				unknown = {
					minimum = 0,
					maximum = 100,
					label = "Inconnue"
				},
				neutral = {
					minimum = 101,
					maximum = 200,
					label = "Neutre"
				},
				familiar = {
					minimum = 201,
					maximum = 300,
					label = "Familier"
				},
				friendly = {
					minimum = 301,
					maximum = 400,
					label = "Amical"
				},
				respect = {
					minimum = 401,
					maximum = 500,
					label = "Respecter"
				}
			}
		}
	}
}

Rep = {}
RepFnc = {} 

Rep.Utils = {
	ped = 0,
	pedCoords = vector3(0,0,0)
}