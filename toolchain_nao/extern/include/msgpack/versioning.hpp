/*
 * MessagePack for C++ version switcher
 *
 * Copyright (C) 2014 KONDO Takatoshi
 *
 *    Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *    http://www.boost.org/LICENSE_1_0.txt)
 */
#ifndef MSGPACK_VERSIONING_HPP
#define MSGPACK_VERSIONING_HPP

#if !defined(MSGPACK_DEFAULT_API_VERSION)
#define MSGPACK_DEFAULT_API_VERSION 3
#endif

#define MSGPACK_DEFAULT_API_NS MSGPACK_DETAIL_PP_CAT(v, MSGPACK_DEFAULT_API_VERSION)

#if   MSGPACK_DEFAULT_API_VERSION == 1
#define MSGPACK_DETAIL_PP_ENABLE_NS_v1 ()
#elif MSGPACK_DEFAULT_API_VERSION == 2
#define MSGPACK_DETAIL_PP_ENABLE_NS_v2 ()
#elif MSGPACK_DEFAULT_API_VERSION == 3
#define MSGPACK_DETAIL_PP_ENABLE_NS_v3 ()
#else
#error
#endif

#define MSGPACK_DETAIL_PP_CAT(a, ...) MSGPACK_DETAIL_PP_PRIMITIVE_CAT(a, __VA_ARGS__)
#define MSGPACK_DETAIL_PP_PRIMITIVE_CAT(a, ...) a ## __VA_ARGS__

#define MSGPACK_DETAIL_PP_IIF(c) MSGPACK_DETAIL_PP_PRIMITIVE_CAT(MSGPACK_DETAIL_PP_IIF_, c)
#define MSGPACK_DETAIL_PP_IIF_0(t, ...) __VA_ARGS__
#define MSGPACK_DETAIL_PP_IIF_1(t, ...) t

#define MSGPACK_DETAIL_PP_PROBE(x) x, 1

#if defined(_MSC_VER)

#define MSGPACK_DETAIL_PP_MSVC_VA_ARGS_WORKAROUND(define, args) define args
#define MSGPACK_DETAIL_PP_CHECK(...) MSGPACK_DETAIL_PP_MSVC_VA_ARGS_WORKAROUND(MSGPACK_DETAIL_PP_CHECK_N, (__VA_ARGS__, 0, 0))
#define MSGPACK_DETAIL_PP_CHECK_N(x, n, ...) n

#else  // defined(__MSC_VER)

#define MSGPACK_DETAIL_PP_CHECK(...) MSGPACK_DETAIL_PP_CHECK_N(__VA_ARGS__, 0, 0)
#define MSGPACK_DETAIL_PP_CHECK_N(x, n, ...) n

#endif // defined(__MSC_VER)


#define MSGPACK_DETAIL_PP_NS_ENABLED_PROBE(ns)            MSGPACK_DETAIL_PP_NS_ENABLED_PROBE_PROXY( MSGPACK_DETAIL_PP_ENABLE_NS_##ns )
#define MSGPACK_DETAIL_PP_NS_ENABLED_PROBE_PROXY(...)     MSGPACK_DETAIL_PP_NS_ENABLED_PROBE_PRIMIVIE(__VA_ARGS__)
#define MSGPACK_DETAIL_PP_NS_ENABLED_PROBE_PRIMIVIE(x)    MSGPACK_DETAIL_PP_NS_ENABLED_PROBE_COMBINE_ x
#define MSGPACK_DETAIL_PP_NS_ENABLED_PROBE_COMBINE_(...)  MSGPACK_DETAIL_PP_PROBE(~)

#define MSGPACK_DETAIL_PP_IS_NS_ENABLED(ns) MSGPACK_DETAIL_PP_CHECK(MSGPACK_DETAIL_PP_NS_ENABLED_PROBE(ns))

#if __cplusplus < 201103L
#define MSGPACK_API_VERSION_NAMESPACE(ns) MSGPACK_DETAIL_PP_IIF(MSGPACK_DETAIL_PP_IS_NS_ENABLED(ns)) \
    (namespace ns{}; using namespace ns; namespace ns, \
     namespace ns)

#else  // __cplusplus < 201103L

#define MSGPACK_API_VERSION_NAMESPACE(ns) MSGPACK_DETAIL_PP_IIF(MSGPACK_DETAIL_PP_IS_NS_ENABLED(ns)) \
    (inline namespace ns, namespace ns)

#endif // __cplusplus < 201103L

#endif // MSGPACK_VERSIONING_HPP
