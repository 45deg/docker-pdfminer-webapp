FROM python:2-alpine
MAINTAINER 45deg
EXPOSE 8080

# Install git
RUN apk update && apk add --no-cache git make
# Fetch the code
RUN git clone https://github.com/euske/pdfminer.git
# Build 
WORKDIR pdfminer
RUN make cmap && python setup.py install

RUN mkdir var
CMD ["python", "tools/runapp.py", "tools/pdf2html.cgi"]
