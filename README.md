# DistinctUntilChangedBugExample

`Observable<(Bool, Bool)>.distinctUntilChanged` behaives unexpectedly.

```Swift
Observable<(Bool, Bool)>
    .of(
      (false, false),
      (true, false),
      (false, true),
      (true, true)
    )
    .distinctUntilChanged { $0 == $1 }
    .subscribe(onNext: { print("onNext: \($0)") })
    .disposed(by: bag)
```

I expected the following output,

```
onNext: (false, false)
onNext: (true, false)
onNext: (false, true)
onNext: (true, true)
```

but actually the result is like below

```
onNext: (false, false)
onNext: (true, false)
onNext: (true, true)
```

---

I though it might be a bug belongs to `Swift` language, but it's not.

```Swift
print((false, false) == (true, false)) // false
print((false, false) == (true, false)) // false
print((false, false) == (true, false)) // false
```
