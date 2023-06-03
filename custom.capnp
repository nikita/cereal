using Cxx = import "./include/c++.capnp";
$Cxx.namespace("cereal");

using Java = import "./include/java.capnp";
$Java.package("ai.flow.definitions");
$Java.outerClassname("CustomDefinitions");

@0xb526ba661d550a59;

# custom.capnp: a home for empty structs reserved for custom forks
# These structs are guaranteed to remain reserved and empty in mainline
# cereal, so use these if you want custom events in your fork.

# you can rename the struct, but don't change the identifier
struct ModelRaw @0x81c2f05a394cf4af {
  frameId @0 :UInt32;
  frameIdExtra @1 :UInt32;
  frameAge @2 :UInt32;
  frameDropPerc @3 :Float32;
  timestampEof @4 :UInt64;
  modelExecutionTime @5 :Float32;
  valid @6 :Bool;

  rawPredictions @7 :List(Float32);
}

struct FrameBuffer @0xaedffd8f31e7b55d {
  image @0 :Data;
  # address is useful to share buffer within same process.
  imageAddress @1 :UInt64;
  encoding @2 :Encoding;

  frameWidth @3 :Int32;
  frameHeight @4 :Int32;

  stride @5 :Int32;
  yWidth @6 :Int32;
  yHeight @7 :Int32;
  yPixelStride @8 :Int32;
  uvWidth @9 :Int32;
  uvHeight @10 :Int32;
  uvPixelStride @11 :Int32;
  uOffset @12 :Int32;
  vOffset @13 :Int32;

  enum Encoding {
    yuv @0;
    rgb @1;
  }
}

struct CustomReserved2 @0xf35cc4560bbf6ec2 {
}

struct CustomReserved3 @0xda96579883444c35 {
}

struct CustomReserved4 @0x80ae746ee2596b11 {
}

struct CustomReserved5 @0xa5cd762cd951a455 {
}

struct CustomReserved6 @0xf98d843bfd7004a3 {
}

struct CustomReserved7 @0xb86e6369214c01c8 {
}

struct CustomReserved8 @0xf416ec09499d9d19 {
}

struct CustomReserved9 @0xa1680744031fdb2d {
}
