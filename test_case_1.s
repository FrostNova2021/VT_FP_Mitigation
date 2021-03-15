; ModuleID = './test_case_1.c'
source_filename = "./test_case_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.test_object = type { i32, i32 ()*, i32 (i32)*, i32 ()* }
%struct.anon = type { i32, i32 (i32)* }

@.str = private unnamed_addr constant [15 x i8] c"var call = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"struct call = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"struct point call = %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @test() #0 {
  ret i32 1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @add(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = mul nsw i32 %3, 2
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_case1() #0 {
  %1 = alloca i32 ()*, align 8
  store i32 ()* @test, i32 ()** %1, align 8
  %2 = load i32 ()*, i32 ()** %1, align 8
  %3 = call i32 %2()
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i32 %3)
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_case2() #0 {
  %1 = alloca %struct.test_object, align 8
  %2 = getelementptr inbounds %struct.test_object, %struct.test_object* %1, i32 0, i32 0
  store i32 1, i32* %2, align 8
  %3 = getelementptr inbounds %struct.test_object, %struct.test_object* %1, i32 0, i32 1
  store i32 ()* @test, i32 ()** %3, align 8
  %4 = getelementptr inbounds %struct.test_object, %struct.test_object* %1, i32 0, i32 2
  store i32 (i32)* @add, i32 (i32)** %4, align 8
  %5 = getelementptr inbounds %struct.test_object, %struct.test_object* %1, i32 0, i32 3
  store i32 ()* @test, i32 ()** %5, align 8
  %6 = getelementptr inbounds %struct.test_object, %struct.test_object* %1, i32 0, i32 2
  %7 = load i32 (i32)*, i32 (i32)** %6, align 8
  %8 = call i32 %7(i32 10)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 %8)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_case3() #0 {
  %1 = alloca %struct.test_object*, align 8
  %2 = call noalias i8* @malloc(i64 32) #3
  %3 = bitcast i8* %2 to %struct.test_object*
  store %struct.test_object* %3, %struct.test_object** %1, align 8
  %4 = load %struct.test_object*, %struct.test_object** %1, align 8
  %5 = getelementptr inbounds %struct.test_object, %struct.test_object* %4, i32 0, i32 0
  store i32 2, i32* %5, align 8
  %6 = load %struct.test_object*, %struct.test_object** %1, align 8
  %7 = getelementptr inbounds %struct.test_object, %struct.test_object* %6, i32 0, i32 1
  store i32 ()* @test, i32 ()** %7, align 8
  %8 = load %struct.test_object*, %struct.test_object** %1, align 8
  %9 = getelementptr inbounds %struct.test_object, %struct.test_object* %8, i32 0, i32 2
  store i32 (i32)* @add, i32 (i32)** %9, align 8
  %10 = load %struct.test_object*, %struct.test_object** %1, align 8
  %11 = getelementptr inbounds %struct.test_object, %struct.test_object* %10, i32 0, i32 3
  store i32 ()* @test, i32 ()** %11, align 8
  %12 = load %struct.test_object*, %struct.test_object** %1, align 8
  %13 = getelementptr inbounds %struct.test_object, %struct.test_object* %12, i32 0, i32 2
  %14 = load i32 (i32)*, i32 (i32)** %13, align 8
  %15 = call i32 %14(i32 20)
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 %15)
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test_case4() #0 {
  %1 = alloca %struct.anon, align 8
  %2 = getelementptr inbounds %struct.anon, %struct.anon* %1, i32 0, i32 0
  store i32 2, i32* %2, align 8
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %1, i32 0, i32 1
  store i32 (i32)* @add, i32 (i32)** %3, align 8
  %4 = getelementptr inbounds %struct.anon, %struct.anon* %1, i32 0, i32 1
  %5 = load i32 (i32)*, i32 (i32)** %4, align 8
  %6 = call i32 %5(i32 20)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 %6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @test_case1()
  call void @test_case2()
  call void @test_case3()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.1"}
