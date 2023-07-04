<?php

namespace App\Traits;

trait HttpResponses
{
    protected function success($data, $message = "Request was successful.", $code = 200)
    {
        return response()->json([
            'status' => $code,
            'message' => $message,
            'data' => $data
        ], $code);
    }

    protected function error($data, $message = 'An error has occurred.', $code)
    {
        return response()->json([
            'status' => $code,
            'message' => $message,
            'data' => $data
        ], $code);
    }
}