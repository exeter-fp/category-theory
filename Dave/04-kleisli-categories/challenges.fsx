(* Writer *)
type Writer<'T> = 'T * string
type WriterMorphism<'a,'b> = 'a -> Writer<'b>

let writerCompose (f:WriterMorphism<'a,'b>) (g:WriterMorphism<'b,'c>) =
    fun a -> 
        let r1,l1 = f a
        let r2,l2 = g r1
        r2, (l1+l2)

(* Partial *)
type Maybe<'T> = option<'T>
type MaybeMorphism<'a,'b> = 'a -> Maybe<'b>

let maybeCompose (f:MaybeMorphism<'a,'b>) (g:MaybeMorphism<'b,'c>) =
    fun a -> match f a with
             | Some x -> g x
             | None -> None

let (>=>) = maybeCompose

let retn x = Some(x)

let safe_reciprocal = function
    | 0. -> None
    | x -> Some(1./x)

let safe_root = function
    | x when x <= 0. -> None
    | x -> x |> sqrt |> Some

let safe_root_receiprocal = safe_reciprocal >=> safe_root
