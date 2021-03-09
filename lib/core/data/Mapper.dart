abstract class Mapper<F,T>{
  T mapFromTo(F f);
  F mapToFrom(T t);
}