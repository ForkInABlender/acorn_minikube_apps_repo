#Dylan Kenneth Eliot
#
#Useful for templating and demonstrating usage with the Acorn.io binary.
#
FROM python:3.9
WORKDIR /app
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ADD requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["flask", "run"]
