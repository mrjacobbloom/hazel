# Hazel

Hazel is a live functional programming environment rooted in the principles
of type theory. You can find the relevant papers and more motivation at
[the Hazel website](http://hazel.org/).

## Building Hazel
You can build Hazel using the following instructions.

### Prerequisites

Hazel is implemented in Reason/OCaml, and is compiled to Javascript for the web browser via the `js_of_ocaml` compiler. An easy way to install both OCaml and the necessary libraries is to install [opam](https://opam.ocaml.org/). After having installed `opam` using the instructions on their website, follow these steps:

  - Make sure you have OCaml 4.07.1+:

    ```sh
    > ocaml --version
    The OCaml toplevel, version 4.07.1
    ```

  - Make sure opam is updated:

    ```sh
    > opam update
    ```

  - Install the necessary OCaml dependencies:

    ```sh
    > opam install dune reason js_of_ocaml tyxml deriving ppx_deriving reactiveData js_of_ocaml-tyxml camomile menhir oUnit
    ```

### Compilation

We can now build the application.

```sh
> cd src
> make
```

The `make` command simply runs `dune build --auto-promote`, which does four things:

1. Generates some parsers using `menhir`.
2. Auto-formats all reason code, using `refmt` (this is why we need `auto-promote`).
3. Compiles the Reason code to OCaml bytecode using the OCaml compiler.
4. Compiles the OCaml bytecode to JavaScript (`src/build/default/www/hazel.js`) using `js_of_ocaml`.

If something weird is going on, it sometimes helps to do a `make clean`.

### Debugging
You can use `make debug` instead of `make`. This differs only in that we pass the `--debuginfo` flag to `js_of_ocaml`, which causes the insertion of comments mapping locations in the generated JS to locations in the source files. This is useful for debugging purposes, but causes a substantial increase in compilation time and file size, so it is disabled by default.

### Results
You can now open `src/_build/default/www/hazel.html` in a browser to see Hazel in action.

