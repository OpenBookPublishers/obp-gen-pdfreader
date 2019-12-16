FROM python:3.8.0-slim-buster

ENV PDF_MINE_VERSION=0.0.4
ENV PDF_TO_BOOK_READER_VERSION=0.0.5

WORKDIR /ebook_automation

RUN apt-get update && \
    apt-get install -y git make imagemagick unzip
RUN rm -rf /var/cache/apt/*

ADD https://github.com/OpenBookPublishers/PDF-Mine/archive/${PDF_MINE_VERSION}.zip /tmp/.
RUN unzip /tmp/${PDF_MINE_VERSION}.zip -d ./
ADD https://github.com/OpenBookPublishers/pdf_to_book_reader/archive/${PDF_TO_BOOK_READER_VERSION}.zip /tmp/.
RUN unzip /tmp/${PDF_TO_BOOK_READER_VERSION}.zip -d ./
RUN mv PDF-Mine-${PDF_MINE_VERSION} PDF-Mine/
RUN mv pdf_to_book_reader-${PDF_TO_BOOK_READER_VERSION} pdf_to_book_reader/
RUN git clone https://github.com/euske/pdfminer.git

COPY ./ ./

ENV OUTDIR=/ebook_automation/output

CMD bash run pdf_file
