import azure.functions as func
import logging
import json
import openai
import os

app = func.FunctionApp(http_auth_level=func.AuthLevel.ANONYMOUS)

@app.function_name(name="chat")
@app.route(route="chat", auth_level=func.AuthLevel.ANONYMOUS, methods=["POST"])
def chat(req: func.HttpRequest) -> func.HttpResponse:
    logging.info("Chat request received.")
    try:
        req_body = req.get_json()
        prompt = req_body.get("prompt")
        openai.api_key = os.getenv("OPENAI_API_KEY")
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": prompt}]
        )
        reply = response.choices[0].message["content"]
        return func.HttpResponse(json.dumps({"reply": reply}), mimetype="application/json")
    except Exception as e:
        logging.error(f"Error: {str(e)}")
        return func.HttpResponse("Error processing request", status_code=500)
