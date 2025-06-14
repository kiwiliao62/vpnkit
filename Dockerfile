FROM ocaml/opam:alpine-3.19-ocaml-4.14 AS  binary
RUN opam update

ADD . /home/opam/vpnkit
RUN opam pin add vpnkit /home/opam/vpnkit --kind=path -n
RUN opam depext vpnkit -y

RUN opam install vpnkit -y
