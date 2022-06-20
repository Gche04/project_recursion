
def fibs_no_rec(n, arr = [0, 1])
    for i in 2..n do
        arr << arr[i-2] + arr[i-1]
    end
    arr
end

def fibs_rec(n)
    n < 3? 1 : fibs_rec(n-2) + fibs_rec(n-1)
end

def fibs_rec_arr(n)
    arr = []
    for i in 0..n do
        arr << fibs_rec(i)
    end
    arr
end



def merge_sort(arr)
    return arr if arr.length < 1

    if arr.length <= 3
        splited_arr = split_arr(arr)

        arr_a = sorted(splited_arr[0])
        arr_b = sorted(splited_arr[1])

        merged_splitted(arr_a, arr_b)
    else
        splited_arr = split_arr(arr)
        arr_b = sorted(merge_sort(splited_arr[1]))
        arr_a = sorted(merge_sort(splited_arr[0]))

        merged_splitted(arr_a, arr_b)
    end
end


def split_arr(arr)
    b = []
    c = []
    half_lenght = arr.length/2
    
    half_lenght.times{
        b << arr.delete_at(0)
    }
    arr.length.times{
        c << arr.delete_at(0)
    }
    arr.push(b, c) 
end

def sorted(arr)
    i = 1
    return arr if arr.length == i
    while i < arr.length
        if arr[i] < arr[i -1]
            hold = arr[i]
            arr[i] = arr[i -1]
            arr[i -1] = hold
            i = 0
        end
        i += 1
    end
    arr
end

def merged_splitted(arr1, arr2)
    merged = []

    until arr1.empty? && arr2.empty?
        if arr1.empty?
            merged << arr2.delete_at(0)
        elsif arr2.empty?
            merged << arr1.delete_at(0) 
        else
            if arr1[0] <= arr2[0]
                merged << arr1.delete_at(0)
            else
                merged << arr2.delete_at(0)
            end
        end
    end
    merged
end



#tests

=begin
a = [5, 4, 7, 6, 2, 8, 16, 19, 11, 300, 1, 0, 24, 32, 68]
b = [5]
c = [5, 4]
d = [5, 4, 7]
=end

=begin
print merge_sort(a)
print merge_sort(b)
print merge_sort(c)
print merge_sort(d)
=end

=begin
print fibs_no_rec(8)
print fibs_rec(8)
print fibs_rec_arr(8)
=end