FROM 4ops/python-dev:3.7.4 as builder

ENV ES_CURATOR_VERSION 5.8.1

RUN pip install setuptools cx_Freeze
RUN git clone https://github.com/elastic/curator.git /usr/src/curator

WORKDIR /usr/src/curator

RUN git checkout "v${ES_CURATOR_VERSION}"
RUN pip install -r requirements.txt
RUN python setup.py build_exe
RUN cp -r /usr/src/curator/build/exe.linux-x86_64-3.7 /curator && du -hs /curator

USER nobody:nobody
ENV LD_LIBRARY_PATH /curator/lib:$LD_LIBRARY_PATH
RUN /curator/curator --version | grep "${ES_CURATOR_VERSION}"

# --- Release image

FROM alpine:3.10

COPY --from=builder /curator /curator

USER nobody:nobody
ENV LD_LIBRARY_PATH /curator/lib:$LD_LIBRARY_PATH
ENTRYPOINT ["/curator/curator"]
CMD ["--help"]
