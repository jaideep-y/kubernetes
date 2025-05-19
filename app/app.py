from flask import Flask, render_template
import psutil

app = Flask(__name__)

@app.route("/")
def index():
    cpu_percent = psutil.cpu_percent(interval=1)
    memory = psutil.virtual_memory()
    return render_template("index.html", cpu=cpu_percent, mem=memory.percent)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)