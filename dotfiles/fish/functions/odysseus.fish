function odysseus
    switch $argv[1]
        case "up"
            echo "▶ Arrancando Odysseus en segundo plano (Red local)..."
            set -gx OAUTHLIB_INSECURE_TRANSPORT 1
            cd ~/odysseus
            
            # Lanzamos en segundo plano ignorando el hangup y ocultando los logs molestos
            nohup ./venv/bin/python -m uvicorn app:app --host 0.0.0.0 --port 7860 > /dev/null 2>&1 &
            
            echo "✔ ¡Odysseus ya está corriendo! Puedes cerrar la terminal."
            echo "🌐 Disponible en: http://localhost:7860 (o la IP de este PC)"
        case "down"
            echo "▶ Apagando Odysseus..."
            pkill -f uvicorn
            pkill -f python
            echo "✔ IA apagada por completo."
        case "restart"
            echo "▶ Reiniciando Odysseus..."
            pkill -f uvicorn
            pkill -f python
            sleep 2
            echo "▶ Volviendo a arrancar en segundo plano..."
            set -gx OAUTHLIB_INSECURE_TRANSPORT 1
            cd ~/odysseus
            nohup ./venv/bin/python -m uvicorn app:app --host 0.0.0.0 --port 7860 > /dev/null 2>&1 &
            echo "✔ IA reiniciada con éxito."
        case "*"
            echo "Uso correcto: odysseus [up | down | restart]"
    end
end
