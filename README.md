#Provider에서 알아야할 것
1) ChangeNotifier
- 값이 변경되면 리스너에게 notify할 수 있는 클래스

2) ChangeNotifierProvider
- 하위 위젯에게 "ChangeNotifier"를 제공해주는 클래스

3) Consumer
- provider에서 값을 받아서 실제로 사용하는 부분

#Read
- 한번만 읽고 다시 읽지 않음

#Watch
- watch는 변하는 프로퍼티의 값을 알고 싶을 때 사용

#Riverpod
- View 로직과 Business 로직을 각가 다른 곳에 위치하도록 함
- dependency들을 주입시켜서 Provider를 어디에서나 읽을 수 있게함
- 애플리케이션을 전부 리렌더링할 필요가 없음
- Riverpod은 Provider의 후속작
- Provider의 한계를 극복하기위해 제작됨

#Provider -> Riverpod 
- Provider나 Riverpod을 사용하는 이유 ===>
- 비지니스 로직과 View 로직을 분리하기위함

- [Riverpod] ProviderScope
- Riverpod는 위젯 트리 안에 존재하지 않음

# ViewModal
- View로부터 이벤트를 받아서 데이터를 수정하며, View에게 데이터가 변했다는 것을 알림
- 이것을 ChangeNotifier로 이행 했음 -> 이것을 Riverpod로 변경
- 그대신 다른 Riverpod class를 extends해서 사용함

# Riverpod
## (Async)NotifierProvider

### Notifier

### AsyncNotifier
- 뷰모델은 API로부터 얻어온 값을 제공할 것
- API로부터 응답을 받을 때까지 기다려야하기때문에 Async를 사용

### NotifierProvider
### AsyncNotifierProvider
- Firebase에서 데이터를 가져오기
- Provider는 데이터를 얻기도하고 가지고 있는 메서드를 밑에서 사용할 수 있게함

# FutureOr


## Ref
- Provide를 가져오거나 읽을 수 있는 레퍼런스
- ref.read나 ref.watch를 하고, 그 안에 Provider를 넣어 주면 완성

## ConsumerState
## ConsumerStatefulWidget

## FutureProvider (Firebase 이용시 사용)


#Riverpod + Firebase