#define MINMAX_TYPE int
#define sampler_t int

#define FLT_MIN          1.19209e-07
#define FLT_MAX	         1e+37

#define MAX_ARRAY_SIZE 1000

#define uchar unsigned char
#define ushort unsigned short
#define uint unsigned int
#define ulong unsigned long


__device__ inline uchar clij_convert_uchar_sat(float value) {
    if (value > 255) {
        return 255;
    }
    if (value < 0) {
        return 0;
    }
    return (uchar)value;
}


__device__ inline char clij_convert_char_sat(float value) {
    if (value > 127) {
        return 127;
    }
    if (value < -128) {
        return -128;
    }
    return (char)value;
}


__device__ inline ushort clij_convert_ushort_sat(float value) {
    if (value > 65535) {
        return 65535;
    }
    if (value < 0) {
        return 0;
    }
    return (ushort)value;
}


__device__ inline short clij_convert_short_sat(float value) {
    if (value > 32767) {
        return 32767;
    }
    if (value < -32768) {
        return -32768;
    }
    return (short)value;
}

__device__ inline uint clij_convert_uint_sat(float value) {
    if (value > 4294967295) {
        return 4294967295;
    }
    if (value < 0) {
        return 0;
    }
    return (uint)value;
}

__device__ inline uint convert_uint_sat(float value) {
    if (value > 4294967295) {
        return 4294967295;
    }
    if (value < 0) {
        return 0;
    }
    return (uint)value;
}


__device__ inline int clij_convert_int_sat(float value) {
    if (value > 2147483647) {
        return 2147483647;
    }
    if (value < -2147483648) {
        return -2147483648;
    }
    return (int)value;
}


__device__ inline uint clij_convert_ulong_sat(float value) {
    if (value > 18446744073709551615) {
        return 18446744073709551615;
    }
    if (value < 0) {
        return 0;
    }
    return (ulong)value;
}

__device__ inline int clij_convert_long_sat(float value) {
    if (value > 9223372036854775807) {
        return 9223372036854775807;
    }
    if (value < -9223372036854775808 ) {
        return -9223372036854775808 ;
    }
    return (long)value;
}

__device__ inline float clij_convert_float_sat(float value) {
    return value;
}


__device__ inline float2 read_buffer3df(int read_buffer_width, int read_buffer_height, int read_buffer_depth, float * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_float2(0, 0);
    }
    return make_float2(buffer_var[pos_in_buffer],0);
}

__device__ inline double2 read_buffer3dd(int read_buffer_width, int read_buffer_height, int read_buffer_depth, double * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_double2(0, 0);
    }
    return make_double2(buffer_var[pos_in_buffer],0);
}

__device__ inline char2 read_buffer3dc(int read_buffer_width, int read_buffer_height, int read_buffer_depth, char * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_char2(0, 0);
    }
    return make_char2(buffer_var[pos_in_buffer],0);
}

__device__ inline uchar2 read_buffer3duc(int read_buffer_width, int read_buffer_height, int read_buffer_depth, uchar * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_uchar2(0, 0);
    }
    return make_uchar2(buffer_var[pos_in_buffer],0);
}

__device__ inline short2 read_buffer3ds(int read_buffer_width, int read_buffer_height, int read_buffer_depth, short * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_short2(0, 0);
    }
    return make_short2(buffer_var[pos_in_buffer],0);
}

__device__ inline ushort2 read_buffer3dus(int read_buffer_width, int read_buffer_height, int read_buffer_depth, ushort * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_ushort2(0, 0);
    }
    return make_ushort2(buffer_var[pos_in_buffer],0);
}

__device__ inline int2 read_buffer3di(int read_buffer_width, int read_buffer_height, int read_buffer_depth, int * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_int2(0, 0);
    }
    return make_int2(buffer_var[pos_in_buffer],0);
}

__device__ inline uint2 read_buffer3dui(int read_buffer_width, int read_buffer_height, int read_buffer_depth, uint * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_uint2(0, 0);
    }
    return make_uint2(buffer_var[pos_in_buffer],0);
}

__device__ inline long2 read_buffer3dl(int read_buffer_width, int read_buffer_height, int read_buffer_depth, long * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_long2(0, 0);
    }
    return make_long2(buffer_var[pos_in_buffer],0);
}

__device__ inline ulong2 read_buffer3dul(int read_buffer_width, int read_buffer_height, int read_buffer_depth, ulong * buffer_var, int sampler, int4 position )
{
    int4 pos = make_int4(position.x, position.y, position.z, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width + pos.z * read_buffer_width * read_buffer_height;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height || pos.z < 0 || pos.z >= read_buffer_depth) {
        return make_ulong2(0, 0);
    }
    return make_ulong2(buffer_var[pos_in_buffer],0);
}

__device__ inline void write_buffer3df(int write_buffer_width, int write_buffer_height, int write_buffer_depth, float * buffer_var, int4 pos, float value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3dd(int write_buffer_width, int write_buffer_height, int write_buffer_depth, double * buffer_var, int4 pos, double value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3dc(int write_buffer_width, int write_buffer_height, int write_buffer_depth, char * buffer_var, int4 pos, char value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3duc(int write_buffer_width, int write_buffer_height, int write_buffer_depth, uchar * buffer_var, int4 pos, uchar value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3ds(int write_buffer_width, int write_buffer_height, int write_buffer_depth, short * buffer_var, int4 pos, short value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3dus(int write_buffer_width, int write_buffer_height, int write_buffer_depth, ushort * buffer_var, int4 pos, ushort value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3di(int write_buffer_width, int write_buffer_height, int write_buffer_depth, int * buffer_var, int4 pos, int value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3dui(int write_buffer_width, int write_buffer_height, int write_buffer_depth, uint * buffer_var, int4 pos, uint value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3dl(int write_buffer_width, int write_buffer_height, int write_buffer_depth, long * buffer_var, int4 pos, uint value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer3dul(int write_buffer_width, int write_buffer_height, int write_buffer_depth, ulong * buffer_var, int4 pos, uint value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width + pos.z * write_buffer_width * write_buffer_height;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height || pos.z < 0 || pos.z >= write_buffer_depth) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}


__device__ inline float2 read_buffer2df(int read_buffer_width, int read_buffer_height, int read_buffer_depth, float * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_float2(0, 0);
    }
    return make_float2(buffer_var[pos_in_buffer],0);
}

__device__ inline double2 read_buffer2dd(int read_buffer_width, int read_buffer_height, int read_buffer_depth, double * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_double2(0, 0);
    }
    return make_double2(buffer_var[pos_in_buffer],0);
}

__device__ inline char2 read_buffer2dc(int read_buffer_width, int read_buffer_height, int read_buffer_depth, char * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_char2(0, 0);
    }
    return make_char2(buffer_var[pos_in_buffer],0);
}

__device__ inline uchar2 read_buffer2duc(int read_buffer_width, int read_buffer_height, int read_buffer_depth, uchar * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_uchar2(0, 0);
    }
    return make_uchar2(buffer_var[pos_in_buffer],0);
}

__device__ inline short2 read_buffer2ds(int read_buffer_width, int read_buffer_height, int read_buffer_depth, short * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_short2(0, 0);
    }
    return make_short2(buffer_var[pos_in_buffer],0);
}

__device__ inline ushort2 read_buffer2dus(int read_buffer_width, int read_buffer_height, int read_buffer_depth, ushort * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_ushort2(0, 0);
    }
    return make_ushort2(buffer_var[pos_in_buffer],0);
}

__device__ inline int2 read_buffer2di(int read_buffer_width, int read_buffer_height, int read_buffer_depth, int * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_int2(0, 0);
    }
    return make_int2(buffer_var[pos_in_buffer],0);
}

__device__ inline uint2 read_buffer2dui(int read_buffer_width, int read_buffer_height, int read_buffer_depth, uint * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_uint2(0, 0);
    }
    return make_uint2(buffer_var[pos_in_buffer],0);
}

__device__ inline long2 read_buffer2dl(int read_buffer_width, int read_buffer_height, int read_buffer_depth, long * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_long2(0, 0);
    }
    return make_long2(buffer_var[pos_in_buffer],0);
}

__device__ inline ulong2 read_buffer2dul(int read_buffer_width, int read_buffer_height, int read_buffer_depth, ulong * buffer_var, int sampler, int2 position )
{
    int4 pos = make_int4(position.x, position.y, 0, 0);
    
    pos.x = max((MINMAX_TYPE)pos.x, (MINMAX_TYPE)0);
    pos.y = max((MINMAX_TYPE)pos.y, (MINMAX_TYPE)0);
    pos.z = max((MINMAX_TYPE)pos.z, (MINMAX_TYPE)0);
    pos.x = min((MINMAX_TYPE)pos.x, (MINMAX_TYPE)read_buffer_width - 1);
    pos.y = min((MINMAX_TYPE)pos.y, (MINMAX_TYPE)read_buffer_height - 1);
    pos.z = min((MINMAX_TYPE)pos.z, (MINMAX_TYPE)read_buffer_depth - 1);

    int pos_in_buffer = pos.x + pos.y * read_buffer_width;
    if (pos.x < 0 || pos.x >= read_buffer_width || pos.y < 0 || pos.y >= read_buffer_height) {
        return make_ulong2(0, 0);
    }
    return make_ulong2(buffer_var[pos_in_buffer],0);
}

__device__ inline void write_buffer2df(int write_buffer_width, int write_buffer_height, int write_buffer_depth, float * buffer_var, int2 pos, float value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2dd(int write_buffer_width, int write_buffer_height, int write_buffer_depth, double * buffer_var, int2 pos, double value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2dc(int write_buffer_width, int write_buffer_height, int write_buffer_depth, char * buffer_var, int2 pos, char value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2duc(int write_buffer_width, int write_buffer_height, int write_buffer_depth, uchar * buffer_var, int2 pos, uchar value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2ds(int write_buffer_width, int write_buffer_height, int write_buffer_depth, short * buffer_var, int2 pos, short value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2dus(int write_buffer_width, int write_buffer_height, int write_buffer_depth, ushort * buffer_var, int2 pos, ushort value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2di(int write_buffer_width, int write_buffer_height, int write_buffer_depth, int * buffer_var, int2 pos, int value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2dui(int write_buffer_width, int write_buffer_height, int write_buffer_depth, uint * buffer_var, int2 pos, uint value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2dl(int write_buffer_width, int write_buffer_height, int write_buffer_depth, long * buffer_var, int2 pos, uint value )
{
   int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}

__device__ inline void write_buffer2dul(int write_buffer_width, int write_buffer_height, int write_buffer_depth, ulong * buffer_var, int2 pos, uint value )
{
    int pos_in_buffer = pos.x + pos.y * write_buffer_width;
    if (pos.x < 0 || pos.x >= write_buffer_width || pos.y < 0 || pos.y >= write_buffer_height) {
        return;
    }
    buffer_var[pos_in_buffer] = value;
}